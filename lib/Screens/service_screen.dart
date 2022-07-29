import 'package:devices/Screens/styles.dart';
import 'package:devices/db/functions/db_functions.dart';
import 'package:devices/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ServiceScreen extends StatefulWidget {
  // final id;
  final name;

  const ServiceScreen({
    Key? key,
    // required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  var passedname = 'none';
  late String _selectedUnit = '-';
  late UnitModel1? newunit;
  String type = '-';
  int _currentSelectionIndex = 0;
  final _replaceDateController = TextEditingController();
  final _runningHrsController = TextEditingController();
  final _nextServiceController = TextEditingController();
  final _serviceDoneController = TextEditingController();
  final _remarksController = TextEditingController();
  late UnitModel1? unit;
  DateTime selectedDate = DateTime.now();

  num balancehrstxt = 0;

  @override
  Widget build(BuildContext context) {
    passedname = widget.name.toString();
    var value = Hive.box<UnitModel1>('unit_db').values.toList().map(
      (UnitModel1 unit) {
        print(unit.name);
      },
    ).toList();


    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(255, 115, 205, 247),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Service',
              style: TextStyle(color: Colors.white),
            ),
          ),
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
                children: [
                  Flexible(
                      flex: 1,
                      child:
                          devicetitle(_selectedUnit, type, 'Service', context)),
                  Flexible(
                    flex: 4,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 20, 15, 40),
                          child: Container(
                            width: 300,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 76, 107, 245),
                                      spreadRadius: 2),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            child: DropdownButton(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              elevation: 2,
                              isExpanded: true,
                              alignment: Alignment.center,
                              hint: Text(_selectedUnit,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  )),
                              items: Hive.box<UnitModel1>('unit_db')
                                  .values
                                  .toList()
                                  .map(
                                (UnitModel1 unit) {
                                  print('id is:- ' + unit.id.toString());

                                  return DropdownMenuItem<UnitModel1>(
                                    value: unit,
                                    child: SizedBox(
                                        width: 300,
                                        child: Text(
                                          unit.name,
                                          textAlign: TextAlign.center,
                                        )),
                                  );
                                },
                              ).toList(),
                              onChanged: <String>(newValue) {
                                print(newValue.runtimeType);
                                setState(() {
                                  _selectedUnit = newValue.toString();
                                  newunit = newValue;
                                  type = newunit!.type.toString();
                                  print(newunit.runtimeType);
                                });
                                return newValue;
                              },
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        formFieldService('Replacement Date', '',
                            _replaceDateController, true, 1),
                        formFieldService('Running Hours', '',
                            _runningHrsController, true, 1),
                        formFieldService('Next Service', '',
                            _nextServiceController, true, 1),
                        formFieldService(
                            'Serviced by', '', _serviceDoneController, true, 1),
                        formFieldService(
                            'Description', '', _remarksController, true, 5),
                        IconButton(
                            onPressed: () {
                              check();
                            },
                            icon: const Icon(Icons.download))
                      ],
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
                _currentSelectionIndex = newIndex;
                // print(newIndex);
                navigationstatus(context);
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.save_alt), label: 'Save'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_back), label: 'Back'),
            ],
          )),
    );
  }

  void navigationstatus(BuildContext context) {
    int a = 0;
    int b = 1;

    if (_currentSelectionIndex == a) {
      //savestatus();
      onUpdateButtonClick(context);
    } else if (_currentSelectionIndex == b) {
      Navigator.pop(context);
    }
  }

  Future<void> check() async {
    final _name = widget.name;
    final _replacementDate = _replaceDateController.text.trim();
    // final _curReading = widget.currentreading;
    // final _preReading = widget.prereading;
    // // final _balanceHours = widget.balanceHrs;
    // final _airPressure = widget.pressure;
    // final _temperature = widget.temperature;
    // final _current = widget.current;
    // final _checkedBy = widget.checkedBy;
    // final _stat = widget.status;
    // final _type = widget.type;
    // final _id = widget.id;
    final _runningHrs = _runningHrsController.text.trim();
    final _nextService = _nextServiceController.text.trim();
    final _servicedBy = _serviceDoneController.text.trim();
    final _remarks = _remarksController.text.trim();
  }

  Future<void> onUpdateButtonClick(BuildContext ctx) async {
    final _name = widget.name;
    final _replacementDate = _replaceDateController.text.trim();
    // final _curReading = widget.currentreading;
    // final _preReading = widget.prereading;
    // // final _balanceHours = widget.balanceHrs;
    // final _airPressure = widget.pressure;
    // final _temperature = widget.temperature;
    // final _current = widget.current;
    // final _checkedBy = widget.checkedBy;
    // final _stat = widget.status;
    // final _type = widget.type;
    // final _id = widget.id;
    final _runningHrs = _runningHrsController.text.trim();
    final _nextService = _nextServiceController.text.trim();
    final _servicedBy = _serviceDoneController.text.trim();
    final _remarks = _remarksController.text.trim();

    // int balance = int.parse(widget.balanceHrs);
    // balancehrstxt = int.parse(_nextService) - int.parse(_runningHrs);
    // final _balanceHours = balancehrstxt.toString();
    print(_name +
        // _type +
        // _id +
        // _preReading +
        // _balanceHours +
        // _stat +
        // _curReading +
        // _airPressure +
        // _temperature +
        // _checkedBy +
        _replacementDate +
        _runningHrs +
        _nextService +
        _servicedBy +
        _remarks);

    if (_replacementDate.isEmpty) {
      String label = "'Replacement Date'";
      alertMsg(ctx, label);
      _replaceDateController.selection;
      return;
    } else if (_runningHrs.isEmpty) {
      String label = "'Running Hours'";
      alertMsg(ctx, label);
      return;
    } else if (_nextService.isEmpty) {
      String label = "'Next Service'";
      alertMsg(ctx, label);
      return;
    } else if (_servicedBy.isEmpty) {
      String label = "'Serviced By'";
      alertMsg(ctx, label);
      return;
    } else if (_remarks.isEmpty) {
      String label = "'Description'";
      alertMsg(ctx, label);
      return;
    } else {
      final _status = UnitModel1(
          // balanceHrs: _balanceHours,
          name: _name,
          // prereading: _preReading,
          // presentreading: _curReading,
          // type: _type,
          // id: _id,
          // status: _stat,
          // airPressure: _airPressure,
          // airendTemperature: _temperature,
          // motorCurrent: _current,
          // checkedBy: _checkedBy,
          replacementDate: _replacementDate,
          runningHours: _runningHrs,
          nextService: _nextService,
          servicedBy: _servicedBy,
          description: _remarks);

      // updateUnit(widget.id, _status);
    }
    Navigator.pop(ctx);
  }
}

class Data {
  final String devicename;
  final String type;

  Data({required this.devicename, required this.type});
}
