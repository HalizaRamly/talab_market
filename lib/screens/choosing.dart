import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/user.dart';
import 'package:talab_market/screens/template.dart';
import 'package:talab_market/screens/template2.dart';
import 'package:talab_market/services/databaseuser.dart';
import 'package:talab_market/shared/loading.dart';

class Choosing extends StatefulWidget {
  @override
  ChoosingState createState() => ChoosingState();
}

class ChoosingState extends State<Choosing> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DataUser(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            if (userData.privilege == 2) {
              return Template();
            }
            ;
            if (userData.privilege == 1) {
              return Template2();
            }
          } else {
            return Loading();
          }
        });
  }
}
