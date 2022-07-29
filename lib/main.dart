import 'package:devices/Screens/splash_screen.dart';
import 'package:devices/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import 'db/model/data_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UnitModel1Adapter());
  // Hive.ignoreTypeId<UnitModel1>(0);
// if (!Hive.isAdapterRegistered(UnitModel1Adapter().typeId)) {
//     Hive.registerAdapter(UnitModel1Adapter());
//   }
  // Hive.registerAdapter(UnitModel1Adapter());
  // Hive.deleteBoxFromDisk('unit_db');
  // await Hive.openBox<UnitModel1>('Unit_db');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devices',
      theme: ThemeData(
        primarySwatch: (Colors.lightBlue),
      ),
      // home: const ListScreen(),
      home: const SplashScreen(),
    );
  }
}
