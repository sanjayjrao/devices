// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:devices/Screens/styles.dart';
import 'package:flutter/material.dart';

class UnitLogScreen extends StatefulWidget {
  final name;
  final type;
  final reading;
  final status;
  final balancehrs;
  final pressure;
  final temperature;
  final current;
  final checkedby;
  final replacedDate;
  final runningHrs;
  final nextService;
  final servicedBy;
  final description;

  const UnitLogScreen(
      this.name,
      this.type,
      this.reading,
      this.status,
      this.balancehrs,
      this.pressure,
      this.temperature,
      this.current,
      this.checkedby,
      this.replacedDate,
      this.runningHrs,
      this.nextService,
      this.servicedBy,
      this.description,
      {Key? key})
      : super(key: key);

  @override
  State<UnitLogScreen> createState() => _UnitLogScreenState();
}

class _UnitLogScreenState extends State<UnitLogScreen> {
  // late String _selectedUnit = 'Select';
  final _namecontroller = TextEditingController();
  final _typecontroller = TextEditingController();
  final _readingcontroller = TextEditingController();
  final _statuscontroller = TextEditingController();
  final _balancehrscontroller = TextEditingController();
  final _pressurecontroller = TextEditingController();
  final _temperaturecontroller = TextEditingController();
  final _currentcontroller = TextEditingController();
  final _checkedcontroller = TextEditingController();
  final _replacementDatecontroller = TextEditingController();
  final _runningHrscontroller = TextEditingController();
  final _nextServicecontroller = TextEditingController();
  final _ServicedBycontroller = TextEditingController();
  final _Descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _namecontroller.text = widget.name;
    _typecontroller.text = widget.type;
    _readingcontroller.text = widget.reading;
    _statuscontroller.text = widget.status;
    _balancehrscontroller.text = widget.balancehrs;
    _pressurecontroller.text = widget.pressure;
    _temperaturecontroller.text = widget.temperature;
    _currentcontroller.text = widget.current;
    _checkedcontroller.text = widget.checkedby;
    _replacementDatecontroller.text = widget.replacedDate;
    _runningHrscontroller.text = widget.runningHrs;
    _nextServicecontroller.text = widget.nextService;
    _ServicedBycontroller.text = widget.servicedBy;
    _Descriptioncontroller.text = widget.description;

    return SimpleDialog(
      title: const Text(
        'Unit Log',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 20, 56, 219),
        ),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.blueGrey, width: 5),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: formFieldService('Name', 'hint', _namecontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService('Type', 'hint', _typecontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Reading', 'hint', _readingcontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Balance Hrs', 'hint', _balancehrscontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Pressure', 'hint', _pressurecontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Airend Temp', 'hint', _temperaturecontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Current', 'hint', _currentcontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Checked by', 'hint', _checkedcontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Replaced Date', 'hint', _replacementDatecontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Running Hrs', 'hint', _runningHrscontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Next Service', 'hint', _nextServicecontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Serviced by', 'hint', _ServicedBycontroller, true, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: formFieldService(
                  'Remarks', 'hint', _Descriptioncontroller, true, 3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 35, 15, 5),
                    child: TextButton(
                      onPressed: () {
                        // onSaveButtonClick();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Ok',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
