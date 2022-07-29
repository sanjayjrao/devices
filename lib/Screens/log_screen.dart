// import 'dart:math';

// import 'package:devices/Screens/pdf_viewer.dart';
import 'package:devices/Screens/remarks_screen.dart';
import 'package:devices/Screens/unit_log_screen.dart';
import 'package:devices/db/functions/db_functions.dart';
import 'package:devices/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

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
  // int id = 0;
  // final doc = pw.Document();

  @override
  Widget build(BuildContext context) {
    // getAllUnits();
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
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
                      print('id is:- ' + unit.id.toString());

                      return DropdownMenuItem<UnitModel1>(
                        value: unit,
                        child: SizedBox(
                            width: 400,
                            child: Text(
                              unit.name,
                              textAlign: TextAlign.center,
                            )),

                        // child: Text(_selectedUnit),
                      );
                    },
                  ).toList(),
                  onChanged: <String>(newValue) {
                    print(newValue.runtimeType);
                    setState(() {
                      _selectedUnit = newValue.toString();
                      newunit = newValue;
                      print(newunit.runtimeType);
                    });
                    return newValue;
                  },
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                if (newunit!.checkedBy != '') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => UnitLogScreen(
                        newunit!.name,
                        newunit!.type,
                        newunit!.prereading,
                        newunit!.balanceHrs,
                        newunit!.airPressure,
                        newunit!.airendTemperature,
                        newunit!.motorCurrent,
                        newunit!.checkedBy,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (ctx1) {
                      return AlertDialog(
                        title: Text(
                          'Error',
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                          'Some Values Missing, Please Update the Values:',
                          style: TextStyle(color: Colors.red),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx1).pop(),
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.get_app_outlined),
            ),
            IconButton(
                onPressed: () {
                  const int ind = 3;
                  deleteUnit(ind);
                },
                icon: const Icon(Icons.delete)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ListTest(),
                    ),
                  );
                },
                icon: const Icon(Icons.agriculture_sharp))
          ],
        ),
      ),
    ));
  }

  // Future<void> createPdf() async {
  //   // PdfDocument document = PdfDocument();
  //   print(doc);
  //   doc.addPage(
  //     pw.Page(
  //       pageFormat: PdfPageFormat.a4,
  //       build: (pw.Context context) {
  //         return pw.Center(
  //           child: pw.Text("Hello World"),
  //         ); // Center
  //       },
  //     ),
  //   );
  // }

  // Future savePdf() async {
  //   Directory documentDirectory = await getApplicationDocumentsDirectory();

  //   String docPath = documentDirectory.path;
  //   File file = File('$docPath/sample.pdf');
  //   file.writeAsBytesSync(await doc.save());
  // }

}
