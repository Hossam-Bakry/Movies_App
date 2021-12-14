import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/layout/home_layout.dart';
import 'package:movies_app/services/provider/app_provider.dart';
import 'package:movies_app/services/style/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: const MyApp(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.defaultTheme,
      routes: {
        HomeLayout.routeName: (BuildContext context) => HomeLayout(),
        // DetailsScreen.routeName: (BuildContext context) => DetailsScreen(),
      },
      initialRoute: HomeLayout.routeName,
    );
  }
}
