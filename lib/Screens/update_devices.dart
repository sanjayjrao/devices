// import 'dart:math';

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:devices/Screens/service_screen.dart';
import 'package:devices/Screens/styles.dart';
import 'package:devices/db/functions/db_functions.dart';
import 'package:devices/db/model/data_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class UpdateScreen extends StatefulWidget {
  final name;
  final type;
  final stat;
  final prereading;
  final currentreading;
  final id;
  final hrs;
  final pressure;
  final temperature;
  final current;
  final checkedBy;
  final replacementDate;
  final runningHours;
  final nextService;
  final servicedBy;
  final description;

  const UpdateScreen(
      this.name,
      this.type,
      this.stat,
      this.prereading,
      this.currentreading,
      this.id,
      this.hrs,
      this.pressure,
      this.temperature,
      this.current,
      this.checkedBy,
      this.replacementDate,
      this.runningHours,
      this.nextService,
      this.servicedBy,
      this.description,
      {Key? key})
      : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var stati = 'Select';
  var balancehrstxt = 0;
  Color _color = Colors.transparent;
  int _currentSelectionIndex = 0;
  final _state = ['Active', 'Inactive', 'Breakdown'];
  final _curReadingController = TextEditingController();
  final _preReadingController = TextEditingController();
  final _balanceHoursController = TextEditingController();
  final _airpressureController = TextEditingController();
  final _airendTemperatureController = TextEditingController();
  final _motorCurrentController = TextEditingController();
  final _checkedByController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    var st = widget.stat;
    print('start ' + st + '  ' + stati);

    if (st != stati && stati != 'Select') {
      st = stati;
      print('inside ' + st);
    } else {
      stati = st;
      print('else ' + st + '  ' + stati);
    }

    int curreading = int.parse(widget.currentreading);
    balancehrstxt = 3000 - curreading;
    _preReadingController.text = curreading.toString();
    _balanceHoursController.text = balancehrstxt.toString();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 115, 205, 247),
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text(
        //     'Daily Updates',
        //     style: TextStyle(color: CupertinoColors.systemGrey5, fontSize: 25),
        //   ),
        // ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color.fromARGB(255, 115, 205, 247), width: 15),
              borderRadius: const BorderRadius.all(
                Radius.circular(35),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child:
                      devicetitle(widget.name, widget.type, 'daily', context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        formFielddaily('Present Reading', '',
                            _curReadingController, true, TextInputType.number),
                        formFielddaily('Previous Reading', '',
                            _preReadingController, false, TextInputType.number),
                        formFielddaily(
                            'Balance Hours',
                            '',
                            _balanceHoursController,
                            false,
                            TextInputType.number),
                        Row(
                          children: [
                            Flexible(
                              child: formFielddaily(
                                  'Air Pressure',
                                  '',
                                  _airpressureController,
                                  true,
                                  TextInputType.number),
                            ),
                            Flexible(
                              child: formFielddaily(
                                  'Airend Temp',
                                  '',
                                  _airendTemperatureController,
                                  true,
                                  TextInputType.number),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 15, right: 30),
                                  child: CheckboxListTile(
                                    title: const Text(
                                      'Oil Level',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    value: true,
                                    onChanged: (newvalue) {},
                                  ),
                                ),
                              ),
                              Flexible(
                                child: formFielddaily(
                                    'Motor Current',
                                    '',
                                    _motorCurrentController,
                                    true,
                                    TextInputType.number),
                              )
                            ],
                          ),
                        ),
                        // formFielddaily(
                        //     'Motor Current', '', _motorCurrentController, true),
                        formFielddaily('Checked by', '', _checkedByController,
                            true, TextInputType.name),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Text(
                                  'Status',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 10),
                                child: Container(
                                  width: 140,
                                  height: 30,
                                  color: status(stati, st),
                                  child: const Text(
                                    '    ',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            children: [
                              DropdownButtonFormField(
                                hint: Text(
                                  stati,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                items: _state.map(
                                  (e) {
                                    return DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(
                                          e,
                                          textAlign: TextAlign.center,
                                        ));
                                  },
                                ).toList(),
                                onChanged: <String>(value) {
                                  stati = value;
                                  _color = status(stati, st);
                                  setState(() {
                                    _color;
                                    stati;
                                  });
                                  print('stati ' + stati);
                                  return stati;
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: TextFormField(
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Comments'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 221, 229, 233),
          currentIndex: _currentSelectionIndex,
          onTap: (newIndex) {
            setState(() {
              // build(ctx1);
              _currentSelectionIndex = newIndex;
              // print(newIndex);
              navigationstatus(context, stati);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.save_alt), label: 'Save'),
            BottomNavigationBarItem(
                icon: Icon(Icons.miscellaneous_services), label: 'Service'),
            // BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Log'),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back), label: 'Back'),
          ],
        ),
      ),
    );
  }

  Color status(String val, var st) {
    if (val == "Active" || st == "Active") {
      _color = Colors.green;
      return _color;
    } else if (val == "Inactive" || st == "Inactive") {
      _color = Colors.orange;
      return _color;
    } else if (val == "Breakdown" || st == "Breakdown") {
      _color = Colors.red;
      return _color;
    } else {
      _color = const Color.fromARGB(255, 189, 188, 188);
    }
    return _color;
  }

  void navigationstatus(BuildContext context, var stati) {
    int a = 0;
    int b = 1;
    int c = 2;
    if (_currentSelectionIndex == a) {
      //savestatus();
      onUpdateButtonClick(stati, context);
    } else if (_currentSelectionIndex == b) {
      print(stati);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx1) => ServiceScreen(
            // id: widget.id,
            name: widget.name,
            // type: widget.type,
            // currentreading: widget.currentreading,
            // balanceHrs: widget.hrs,
            // prereading: widget.prereading,
            // status: stati,
            // pressure: _airpressureController.text.trim(),
            // temperature: _airendTemperatureController.text.trim(),
            // current: null,
            // checkedBy: null,
          ),
        ),
      );
    } else if (_currentSelectionIndex == c) {
      Navigator.pop(context);
    }
  }

  Future<void> onUpdateButtonClick(var stati, BuildContext ctx) async {
    final _name = widget.name;
    final _currentReading = _curReadingController.text.trim();
    final _preReading = widget.currentreading;
    // final _balanceHours = _balanceHoursController.text.trim();
    final _statu = stati;
    final _type = widget.type;
    final _id = widget.id;
    final _pressure = _airpressureController.text.trim();
    final _temperature = _airendTemperatureController.text.trim();
    final _current = _motorCurrentController.text.trim();
    final _checked = _checkedByController.text.trim();
    var _replacementDate = widget.replacementDate;
    var _runningHrs = widget.runningHours;
    var _nextService = widget.nextService;
    var _servicedBy = widget.servicedBy;
    var _description = widget.description;

    int curreading = int.parse(_currentReading);
    balancehrstxt = 3000 - curreading;
    _balanceHoursController.text = balancehrstxt.toString();
    final _balanceHours = _balanceHoursController.text.trim();

    if (_currentReading.isEmpty) {
      String label = "'Present Reading'";
      alertMsg(ctx, label);
      _curReadingController.selection;
      return;
    } else if (_pressure.isEmpty) {
      String label = "'Air Pressure'";
      alertMsg(ctx, label);
      return;
    } else if (_temperature.isEmpty) {
      String label = "'Airend Temperature'";
      alertMsg(ctx, label);
      return;
    } else if (_current.isEmpty) {
      String label = "'Motor Current'";
      alertMsg(ctx, label);
      return;
    } else if (_checked.isEmpty) {
      String label = "'Checked by'";
      alertMsg(ctx, label);
      return;
    } else if (_statu == "Select") {
      String label = "'Status'";
      alertMsg(ctx, label);
      return;
    } else if (_replacementDate == '') {
      _replacementDate = '0';
      return;
    } else if (_runningHrs == '') {
      _runningHrs = '0';
      return;
    } else if (_nextService == '') {
      _nextService = '0';
      return;
    } else if (_servicedBy == '') {
      _servicedBy = 'nil';
      return;
    } else if (_description == '') {
      _description = '--';
      return;
    } else {
      final _status = UnitModel1(
        balanceHrs: _balanceHours,
        name: _name,
        presentreading: _currentReading,
        prereading: _preReading,
        status: _statu,
        type: _type,
        id: _id,
        airPressure: _pressure,
        airendTemperature: _temperature,
        motorCurrent: _current,
        checkedBy: _checked,
        replacementDate: _replacementDate,
        runningHours: _runningHrs,
        nextService: _nextService,
        servicedBy: _servicedBy,
        description: _description,
      );
      updateUnit(widget.id, _status);
    }
    // print(_balanceHours);
    Navigator.pop(ctx);
  }
}
