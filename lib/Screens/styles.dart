// import 'dart:html';

// import 'dart:js';

import 'package:devices/Screens/add_devices.dart';
import 'package:devices/Screens/pdf_screen.dart';
import 'package:devices/Screens/list_devices.dart';
import 'package:devices/Screens/log_screen.dart';
import 'package:devices/db/functions/db_functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Column containerhome(BuildContext context) {
  return Column(
    children: [
      const Spacer(),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        height: 150,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            rowhome(context, 'List', const ListScreen()),
            rowhome(context, 'Add', AddDevices()),
          ],
        ),
      ),
      const Spacer(),
      SizedBox(
        height: 150,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            rowhome(
                context,
                'Daily',
                const PdfScreen(
                  path: '',
                )),
          ],
        ),
      ),
      const Spacer(),
      SizedBox(
        height: 150,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            rowhome(context, 'Log Check', const LogScreen()),
          ],
        ),
      ),
      const Spacer(),
    ],
  );
}

RawMaterialButton rowhome(BuildContext context, String name, Widget screen) {
  return RawMaterialButton(
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    constraints: const BoxConstraints.tightFor(height: 125, width: 140),
    onPressed: () {
      onClicked(context, screen);
    },
    fillColor: const Color.fromARGB(255, 29, 145, 223),
    child: Text(
      name,
      textAlign: TextAlign.center,
    ),
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );
}

void onClicked(BuildContext ctx, Widget screen) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (ctx1) => screen,
    ),
  );
}

String today = DateFormat("dd-MM-yyyy").format(DateTime.now());

Container devicetitle(String name, String type, String page, BuildContext ctx) {
  if (page == 'daily') {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 76, 107, 245),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 200, top: 5),
                child: Text(
                  today,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  type,
                  style: const TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  } else {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 76, 107, 245),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
              ),
              Text(
                today,
                textAlign: TextAlign.end,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 50),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  type,
                  style: const TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Row formFielddaily(String label, String hint,
    TextEditingController textcontroller, bool condition, TextInputType input) {
  if (label == 'Air Pressure' ||
      label == 'Airend Temp' ||
      label == 'Motor Current') {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 30, top: 10),
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 50, top: 15),
            child: TextFormField(
              textAlign: TextAlign.center,
              enabled: condition,
              keyboardType: input,
              controller: textcontroller,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                isDense: true,
                border: const OutlineInputBorder(),
                hintText: hint,
              ),
            ),
          ),
        )
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 40),
            child: TextFormField(
              textAlign: TextAlign.center,
              enabled: condition,
              keyboardType: input,
              controller: textcontroller,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                isDense: true,
                border: const OutlineInputBorder(),
                hintText: hint,
              ),
            ),
          ),
        )
      ],
    );
  }
}

Row formFieldService(String label, String hint,
    TextEditingController textcontroller, bool condition, var lines) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: TextFormField(
            textAlign: TextAlign.center,
            enabled: condition,
            keyboardType: TextInputType.multiline,
            maxLines: lines,
            controller: textcontroller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              isDense: true,
              border: const OutlineInputBorder(),
              hintText: hint,
            ),
          ),
        ),
      )
    ],
  );
}

Padding addDeviceForm(TextEditingController controller, String hint) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
    ),
  );
}

Future alertMsg(BuildContext ctx, String label) {
  // var builder;
  return showDialog(
    context: ctx,
    builder: (ctx) {
      return AlertDialog(
        title: const Text("Alert"),
        content: Text("Please enter the $label."),
        actions: const [],
      );
    },
  );
}

Future deleteMsg(BuildContext ctx, var id) {
  return showDialog(
    context: ctx,
    builder: (ctx) {
      return AlertDialog(
        title: const Text("Alert"),
        content: const Text("Do you want to delete?"),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              deleteUnit(id);
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Cancel'))
        ],
      );
    },
  );
}
