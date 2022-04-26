import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../util/font_awesome_icon.dart';

class dateTimePicker extends StatefulWidget {
  @override
  _dateTimePickerState createState() => _dateTimePickerState();
}
class _dateTimePickerState extends State<dateTimePicker> {
  @override
  Widget build(BuildContext context) {
    DateTime targetday = DateTime(2022, 4, 26);
    return IconButton(
      icon: calenderIcon,
      onPressed: () {
        DatePicker.showDatePicker(context, 
        currentTime: targetday, locale: LocaleType.jp,
        showTitleActions: true,
        minTime: DateTime(1900, 1,1),
        maxTime: DateTime(2049, 12,31),
        onConfirm: (date) {
          setState(() {
            targetday =date;
          });
        },
        );
      },
    );
  }
}