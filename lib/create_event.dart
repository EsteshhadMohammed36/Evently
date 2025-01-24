import 'package:event_planning/app_theme.dart';
import 'package:event_planning/home/category.dart';
import 'package:event_planning/home/tab_item.dart';
import 'package:event_planning/widgets/custom_event_row.dart';
import 'package:event_planning/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                  "assets/tabs/${Category.categories[selectedIndex].imageName}.png"),
            ),
          ),
          DefaultTabController(
              length: Category.categories.length,
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
                  tabs: Category.categories
                      .map((category) => TabItem(
                          backgroundSelected: Colors.transparent,
                          background: AppTheme.primary,
                          isSelected: !(selectedIndex ==
                              Category.categories.indexOf(category)),
                          category: category))
                      .toList())),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Title",
                      style: textTheme.bodySmall!
                          .copyWith(color: AppTheme.blackColor),
                    ),
                    CustomTextFormField(
                      prefixIconPath: "assets/images/title_icon.png",
                      controller: titleController,
                      hintText: "Event Title",
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Title can not be empty";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Description",
                      style: textTheme.bodySmall!
                          .copyWith(color: AppTheme.blackColor),
                    ),
                    CustomTextFormField(
                      prefixIconPath: null,
                      controller: descriptionController,
                      maxLines: 5,
                      hintText: "Event Description",
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Description can not be empty";
                        return null;
                      },
                    ),
                    CustomEventRow(
                      image: "assets/images/event_date.png",
                      event: "Event Date",
                      choice: selectedDate == null
                          ? "Choose Date"
                          : dateFormat.format(selectedDate!),
                      choiceTap: () async {
                        DateTime? date = await showDatePicker(
                            initialDate: selectedDate,
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)));
                        if (date != null) {
                          selectedDate = date;
                          setState(() {});
                        }
                      },
                    ),
                    CustomEventRow(
                      choiceTap: () async {
                        TimeOfDay? time = await showTimePicker(
                            initialEntryMode: TimePickerEntryMode.dialOnly,
                            context: context,
                            initialTime: selectedTime!);
                        if (time != null) {
                          selectedTime = time;
                          setState(() {});
                        }
                      },
                      image: "assets/images/event_time.png",
                      event: "Event Time",
                      choice: selectedTime == null
                          ? "Choose Time"
                          : selectedTime!.format(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomElevatedButton(
                onPressed: onEventPressed, text: "Add Event"),
          )
        ],
      ),
    );
  }

  void onEventPressed() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {}
  }
}
