import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talab_market/screens/product.dart';
import 'package:talab_market/screens/retailer.dart';
import 'package:talab_market/screens/setting.dart';
import 'package:talab_market/services/auth.dart';
import 'package:talab_market/shared/threedots.dart';

class Template2 extends StatelessWidget {
  final AuthService _auth = AuthService();

  void choiceAction(String choice) {
 if (choice == Threedots.SignOut) {
      _auth.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: new Text("Salesperson's account"),
            elevation: 0.0,
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Threedots.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ]),
        body: GridView.count(
          crossAxisCount: 1,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(2),
                child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60.0),
                              child: Setting(),
                            );
                          });
                    },
                    child: Container(
                        color: Colors.teal[100],
                        padding: const EdgeInsets.all(20),
                        child: Column(children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Image.asset(
                                "assets/profile.png",
                              )),
                          Container(
                            color: Colors.white70,
                            child: const Text(
                              "profile",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ])))),
            Padding(
                padding: EdgeInsets.all(2),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Product(visibility: 2,)));
                    },
                    child: Container(
                        color: Colors.teal[100],
                        padding: const EdgeInsets.all(20),
                        child: Column(children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Image.asset(
                                "assets/product.png",
                              )),
                          Container(
                            color: Colors.white70,
                            child: const Text(
                              "product",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ])))),
            Padding(
                padding: EdgeInsets.all(2),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Retailer(visibility: 2,)));
                    },
                    child: Container(
                        color: Colors.teal[100],
                        padding: const EdgeInsets.all(20),
                        child: Column(children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Image.asset(
                                "assets/retailer.png",
                              )),
                          Container(
                            color: Colors.white70,
                            child: const Text(
                              "Retailer",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ])))),

          ],
        ));
  }
}
