import 'package:flutter/material.dart';

class CustomEventRow extends StatelessWidget {
  String event;
  String choice;
  String image;
  void Function()? choiceTap;

  CustomEventRow(
      {required this.event,
      required this.choice,
      required this.image,
      this.choiceTap});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(
            width: 10,
          ),
          Text(
            event,
            style:
                textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          InkWell(
            onTap: choiceTap,
            child: Text(
              choice,
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
