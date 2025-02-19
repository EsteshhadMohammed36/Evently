import 'package:event_planning/app_theme.dart';
import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/home/tab_item.dart';
import 'package:event_planning/models/category_model.dart';
import 'package:event_planning/models/event_model.dart';
import 'package:event_planning/providers/events_provider.dart';
import 'package:event_planning/providers/theming_provider.dart';
import 'package:event_planning/providers/user_provider.dart';
import 'package:event_planning/widgets/custom_event_row.dart';
import 'package:event_planning/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/custom_elevated_button.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = "create_event";

  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateFormat dateFormat = DateFormat("d/M/yyyy");

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    ThemingProvider themingProvider = Provider.of<ThemingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.createEvent),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                  "assets/tabs/${CategoryModel.categoriesDark[selectedIndex].imageName}.png"),
            ),
          ),
          DefaultTabController(
              length: CategoryModel.categoriesDark.length,
              child: TabBar(
                  tabAlignment: TabAlignment.start,
                  padding: const EdgeInsets.only(left: 11),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding:
                      EdgeInsets.only(left: 5, right: 5, bottom: 16, top: 16),
                  isScrollable: true,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  tabs: CategoryModel.categoriesDark
                      .map((category) => TabItem(
                          backgroundSelected: Colors.transparent,
                          background: AppTheme.primary,
                          isSelected: !(selectedIndex ==
                              CategoryModel.categoriesDark.indexOf(category)),
                          category: category))
                      .toList())),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.title,
                        style: textTheme.bodySmall!
                            .copyWith(color: AppTheme.blackColor),
                      ),
                      CustomTextFormField(
                        prefixIconPath: themingProvider.isDark
                            ? "assets/images/title_dark.png"
                            : "assets/images/title_icon.png",
                        controller: titleController,
                        hintText: l10n.eventTitle,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return l10n.titleEmptyMsg;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        l10n.desc,
                        style: textTheme.bodySmall!
                            .copyWith(color: AppTheme.blackColor),
                      ),
                      CustomTextFormField(
                        prefixIconPath: null,
                        controller: descriptionController,
                        maxLines: 5,
                        hintText: l10n.eventDesc,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return l10n.descEmptyMsg;
                          return null;
                        },
                      ),
                      CustomEventRow(
                        image: themingProvider.isDark
                            ? "assets/images/event_date_dark.png"
                            : "assets/images/event_date.png",
                        event: l10n.eventDate,
                        choice: selectedDate == null
                            ? l10n.chDate
                            : dateFormat.format(selectedDate!),
                        choiceTap: () async {
                          DateTime? date = await showDatePicker(
                              initialDate: selectedDate,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(Duration(days: 365)));
                          if (date != null) {
                            selectedDate = date;
                            setState(() {});
                          }
                        },
                      ),
                      CustomEventRow(
                        event: l10n.eventTime,
                        choice: selectedTime == null
                            ? l10n.chTime
                            : "${selectedTime!.format(context)}",
                        image: themingProvider.isDark
                            ? "assets/images/event_time_dark.png"
                            : "assets/images/event_time.png",
                        choiceTap: () async {
                          TimeOfDay? time = await showTimePicker(
                              initialEntryMode: TimePickerEntryMode.dialOnly,
                              context: context,
                              initialTime: selectedTime == null
                                  ? TimeOfDay.now()
                                  : selectedTime!);
                          if (time != null) {
                            selectedTime = time;
                            setState(() {});
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomElevatedButton(
                onPressed: createEvents, text: l10n.addEvent),
          )
        ],
      ),
    );
  }

  void createEvents() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      DateTime dateTime = DateTime(selectedDate!.year, selectedDate!.month,
          selectedDate!.day, selectedTime!.hour, selectedTime!.minute);
      EventModel event = EventModel(
          userId:
              Provider.of<UserProvider>(context, listen: false).currentUser!.id,
          category: CategoryModel.categories[selectedIndex],
          title: titleController.text,
          description: descriptionController.text,
          dateTime: dateTime);
      FirebaseService.addEventsToFirestore(event).then((_) {
        Provider.of<EventsProvider>(context, listen: false).getEvents();
        Navigator.pop(context);
        print("Event created");
      }).catchError(() {
        print("Failed");
      });
    }
  }
}
