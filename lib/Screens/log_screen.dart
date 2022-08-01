// import 'dart:math';

import 'package:devices/Screens/unit_log_screen.dart';
import 'package:devices/db/functions/db_functions.dart';
import 'package:devices/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({Key? key}) : super(key: key);

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  late String _selectedUnit = 'Select';
  late UnitModel1? newunit;
  String name = '';
  String type = '';
  String reading = '';
  String balancehrs = '';
  String pressure = '';
  String temperature = '';
  String current = '';
  String checked = '';
  bool doubleTapped = false;
  double opaque = 0;
  final _deleteKeycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // getAllUnits();

    return GestureDetector(
      onDoubleTap: () {
        if (doubleTapped == false) {
          print("Double Tapped On");
          doubleTapped = true;
          setState(() {
            opaque = 1.0;
          });
        } else {
          print("Double Tapped Off");
          doubleTapped = false;
          setState(() {
            opaque = 0.0;
          });
        }
      },
      child: Scaffold(
          body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 54, 73, 244),
                        style: BorderStyle.solid,
                        width: 2),
                  ),
                  child: DropdownButton(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    elevation: 2,
                    isExpanded: true,
                    alignment: Alignment.center,
                    hint: Text(_selectedUnit,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    items: Hive.box<UnitModel1>('unit_db').values.toList().map(
                      (UnitModel1 unit) {
                        // print('id is:- ' + unit.id.toString());
                        return DropdownMenuItem<UnitModel1>(
                          value: unit,
                          child: SizedBox(
                              width: 400,
                              child: Text(
                                unit.name + '  -  ' + unit.id.toString(),
                                textAlign: TextAlign.center,
                              )),

                          // child: Text(_selectedUnit),
                        );
                      },
                    ).toList(),
                    onChanged: <String>(newValue) {
                      // print(newValue.runtimeType);
                      setState(() {
                        _selectedUnit = newValue.toString();
                        newunit = newValue;
                        // print(newunit.runtimeType);
                      });
                      return newValue;
                    },
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  if (newunit!.description != '') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => UnitLogScreen(
                            newunit!.name,
                            newunit!.type,
                            newunit!.presentreading,
                            newunit!.status,
                            newunit!.balanceHrs,
                            newunit!.airPressure,
                            newunit!.airendTemperature,
                            newunit!.motorCurrent,
                            newunit!.checkedBy,
                            newunit!.replacementDate,
                            newunit!.runningHours,
                            newunit!.nextService,
                            newunit!.servicedBy,
                            newunit!.description),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (ctx1) {
                        return AlertDialog(
                          title: const Text(
                            'Error',
                            style: TextStyle(color: Colors.red),
                          ),
                          content: const Text(
                            'Some Values Missing, Please Update the Values:',
                            style: TextStyle(color: Colors.red),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx1).pop(),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                icon: const Icon(Icons.get_app_outlined),
              ),
              Opacity(
                opacity: opaque,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: TextFormField(
                          controller: _deleteKeycontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(30),
                              isDense: true),
                        ),
                      ),
                      IconButton(
                          // visualDensity:  ,
                          onPressed: () {
                            int ind =
                                int.parse(_deleteKeycontroller.text.trim());
                            deleteUnit(ind);
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
