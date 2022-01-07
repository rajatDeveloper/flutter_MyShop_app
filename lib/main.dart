import 'package:flutter/material.dart';
import 'package:my_shop/core/store.dart';
import 'package:my_shop/pages/cart_page.dart';
import 'package:my_shop/pages/home_page.dart';
import 'package:my_shop/pages/login_page.dart';
import 'package:my_shop/models/data.dart';
import 'package:my_shop/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const pi = 3.14;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(backgroundColor: Colors.black87),
          canvasColor: Colors.grey,
          primaryColor: Colors.black,
          cardColor: Colors.black,
          // primarySwatch: const Colors.black12,
          // ignore: deprecated_member_use
          buttonColor: Colors.black),

      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.purple,
        ),
        cardColor: Colors.purple,
        primarySwatch: Colors.purple,

        // canvasColor: Colors.purple,
        // fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        //home is defined route
        // "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
