
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/user.dart';
import 'package:talab_market/screens/wrapper.dart';
import 'package:talab_market/services/auth.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,



      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}