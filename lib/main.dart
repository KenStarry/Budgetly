import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/core/utils/hive_utils.dart';
import 'package:budgetly/di/controllers_di.dart';
import 'package:budgetly/di/locator.dart';
import 'package:budgetly/features/feature_main/presentation/main_screen.dart';
import 'package:budgetly/navigation/nav_constants.dart';
import 'package:budgetly/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDocumentDirectory.path);
  Hive.registerAdapter(AccountAdapter());

  invoke();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ControllersDI.invoke();

    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.wait([Hive.openBox(HiveUtils.accountsBox)]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            return Text("Error occured");
          } else if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return const MainScreen();
          } else {
            return Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor)));
          }
        },
      ),
    );
  }
}
