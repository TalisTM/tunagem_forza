import 'package:flutter/material.dart';
import 'package:tunagem_forza/templates/inicio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(),
      theme: ThemeData(
        secondaryHeaderColor: Colors.black,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600
            )
          ),
          color: Colors.black,
          centerTitle: true,
          elevation: 0.4,
          actionsIconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          textTheme: ButtonTextTheme.primary,
          buttonColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        secondaryHeaderColor: Colors.red,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          iconTheme: IconThemeData(
              color: Colors.red,
          ),
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
          ),
          color: Colors.black,
          centerTitle: true,
          elevation: 0.4,
          actionsIconTheme: IconThemeData(
              color: Colors.white
          ),
        ),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          textTheme: ButtonTextTheme.primary,
          buttonColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white
          ),
          bodyText1: TextStyle(
            color: Colors.white
          )
        ),
        brightness: Brightness.dark
      ),
    );
  }
}
