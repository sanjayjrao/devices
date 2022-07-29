import 'package:devices/Screens/add_devices.dart';
import 'package:devices/Screens/log_screen.dart';
import 'package:devices/Screens/styles.dart';
import 'package:devices/Screens/update_devices.dart';
import 'package:devices/db/functions/db_functions.dart';
import 'package:devices/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int _currentSelectionIndex = 0;
  Color _color = Colors.transparent;
  // String balanceHrs = '0';

  @override
  Widget build(BuildContext context) {
    getAllUnits();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Compressors List'),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: unitListNotifier1,
            builder:
                (BuildContext ctx, List<UnitModel1> unitList, Widget? child) {
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = unitList[index];

                  var stati = data.status;

                  _color = status(stati!);
                  // print('listscreen  ' + data.id.toString());

                  // if (data.balanceHrs == '') {
                  //   balanceHrs = '0';
                  // } else {
                  //   balanceHrs = data.balanceHrs.toString();
                  // }

                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.all(10)),
                            const Text(
                              'type:            ',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(data.type!,
                                style: const TextStyle(fontSize: 12))
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.all(10)),
                            const Text(
                              'Balance:     ',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(data.balanceHrs!,
                                style: const TextStyle(fontSize: 12))
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.all(10)),
                            const Text(
                              'Reading:     ',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(data.presentreading!,
                                style: const TextStyle(fontSize: 12))
                          ],
                        )
                      ],
                    ),
                    leading: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      constraints:
                          const BoxConstraints.tightFor(height: 50, width: 150),
                      onPressed: () {
                        int id = data.id;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => UpdateScreen(
                              data.name,
                              data.type,
                              data.status,
                              data.prereading,
                              data.presentreading,
                              id,
                              data.balanceHrs,
                              data.airPressure,
                              data.airendTemperature,
                              data.motorCurrent,
                              data.checkedBy,
                              data.replacementDate,
                              data.runningHours,
                              data.nextService,
                              data.servicedBy,
                              data.description,
                            ),
                          ),
                        );
                      },
                      fillColor: _color,
                      child: Text(
                        data.name!,
                        maxLines: 2,
                      ),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // delete(ctx);
                        // const int ind = 1;
                        // deleteUnit(ind);
                        deleteMsg(ctx, data.id);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: unitList.length,
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentSelectionIndex,
          onTap: (newIndex) {
            setState(() {
              _currentSelectionIndex = newIndex;
              navigationstatus(context);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Log'),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back), label: 'Back'),
          ],
        ),
      ),
    );
  }

  void navigationstatus(BuildContext context) {
    int a = 0;
    int b = 1;
    int c = 2;

    if (_currentSelectionIndex == a) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => AddDevices(), // => Lambda Function
        ),
      );
    } else if (_currentSelectionIndex == b) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const LogScreen(),
        ),
      );
    } else if (_currentSelectionIndex == c) {
      showDialog(
        context: context,
        builder: (ctx2) {
          return AlertDialog(
            title: const Text('Confirm'),
            content: const Text('Do you want to Exit?'),
            actions: [
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx2).pop();
                },
                child: const Text('No'),
              ),
            ],
          );
        },
      );
    }
  }

  Color status(String val) {
    if (val == "Active") {
      _color = Colors.green;
      return _color;
    } else if (val == "Inactive") {
      _color = Colors.orange;
      return _color;
    } else if (val == "Breakdown") {
      _color = Colors.red;
      return _color;
    } else {
      _color = const Color.fromARGB(255, 189, 188, 188);
    }
    return _color;
  }

  // String val(){
  //   if (data.type)
  // }
}
