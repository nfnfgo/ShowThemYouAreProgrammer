import 'package:flutter/material.dart';

// Pages
import 'package:you_are_programmer/pages/home_page.dart';
import 'package:you_are_programmer/pages/test_page.dart';

// Themes
import 'package:you_are_programmer/themes/cyan.dart';

// Models
import 'package:you_are_programmer/models/global_app_info.dart';

// Tools
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalAppInfo>(
            create: (context) => GlobalAppInfo())
      ],
      child: MaterialApp(
        // Route Settings
        initialRoute: '/',
        routes: {
          '': (context) => HomePage(),
          '/test': ((context) => TestPage()),
        },

        title: 'YouAreProgrammer',
        theme: ThemeCyan,
        home: HomePage(),
      ),
    );
  }
}
