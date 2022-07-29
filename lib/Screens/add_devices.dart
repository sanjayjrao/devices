// import 'dart:html';

import 'package:devices/Screens/styles.dart';
import 'package:devices/db/functions/db_functions.dart';
import 'package:devices/db/model/data_model.dart';
import 'package:flutter/material.dart';

class AddDevices extends StatelessWidget {
  AddDevices({Key? key}) : super(key: key);

  final _addNameController = TextEditingController();
  final _addTypeController = TextEditingController();
  final _addReadingController = TextEditingController();
  final _addBalanceHrsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        title: const Text(
          'Add Unit',
          style: TextStyle(
            color: Colors.lightBlueAccent,
          ),
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.blueGrey, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                addDeviceForm(_addNameController, 'Unit Name'),
                addDeviceForm(_addTypeController, 'Unit Type'),
                addDeviceForm(_addReadingController, 'Current Reading'),
                addDeviceForm(_addBalanceHrsController, 'Balance Hrs'),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        onSaveButtonClick();
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> onSaveButtonClick() async {
    final _name = _addNameController.text.trim();
    final _type = _addTypeController.text.trim();
    final _curReading = _addReadingController.text.trim();
    final _balHrs = _addBalanceHrsController.text.trim();

    if (_name.isEmpty || _type.isEmpty) {
      return;
    }

    final _unit = UnitModel1(
        name: _name,
        type: _type,
        balanceHrs: _balHrs,
        presentreading: _curReading,
        status: '',
        id: '');
    addUnit1(_unit);
  }
}
