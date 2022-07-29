// ignore_for_file: prefer_typing_uninitialized_variables

// import 'package:devices/Screens/pdf_screen.dart';
// import 'package:devices/Screens/list_devices.dart';
import 'package:devices/Screens/styles.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// import '../db/functions/db_functions.dart';
// import '../db/model/data_model.dart';

class UnitLogScreen extends StatefulWidget {
  final name;
  final type;
  final reading;
  final balancehrs;
  final pressure;
  final temperature;
  final current;
  final checkedby;

  const UnitLogScreen(this.name, this.type, this.reading, this.balancehrs,
      this.pressure, this.temperature, this.current, this.checkedby,
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
  final _balancehrscontroller = TextEditingController();
  final _pressurecontroller = TextEditingController();
  final _temperaturecontroller = TextEditingController();
  final _currentcontroller = TextEditingController();
  final _checkedcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _namecontroller.text = widget.name;
    _typecontroller.text = widget.type;
    _readingcontroller.text = widget.reading;
    _balancehrscontroller.text = widget.balancehrs;
    _pressurecontroller.text = widget.pressure;
    _temperaturecontroller.text = widget.temperature;
    _currentcontroller.text = widget.current;
    _checkedcontroller.text = widget.checkedby;

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
                // TextButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   child: const Text('Cancel'),
                // ),
              ],
            ),
          ],
        )
      ],
    );
  }

  // SimpleDialog showlog() {
  //   print(_selectedUnit);
  //   return SimpleDialog(
  //     title: Text(
  //       'Log',
  //       style: TextStyle(
  //         color: Colors.lightBlueAccent,
  //       ),
  //     ),
  //     shape: const RoundedRectangleBorder(
  //       side: BorderSide(color: Colors.blueGrey, width: 2),
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(20),
  //       ),
  //     ),
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(15.0),
  //         child: Column(
  //           children: [
  //             formFieldService('Name', 'hint', _namecontroller, true, 1),
  //             Row(
  //               children: [
  //                 TextButton(
  //                   onPressed: () {
  //                     // onSaveButtonClick();
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text('Save'),
  //                 ),
  //                 TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text('Cancel'),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }
}
