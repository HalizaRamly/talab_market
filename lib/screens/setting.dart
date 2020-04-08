import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/user.dart';
import 'package:talab_market/services/databaseuser.dart';
import 'package:talab_market/shared/constants.dart';
import 'package:talab_market/shared/loading.dart';


class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();

}

class  SettingState extends State<Setting> {
  final _formKey1 = GlobalKey<FormState>();

  // form values
  String _currentName;
  String _currentPhone;





  @override
  Widget build(BuildContext context) {



    User user = Provider.of<User>(context);


    return StreamBuilder<UserData>(
        stream: DataUser(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            UserData userData = snapshot.data;



                    return Form(
                        key: _formKey1,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery
                                  .of(context)
                                  .viewInsets
                                  .bottom),
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Text(
                                'Update your profile details',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 20.0),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Email:",
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                initialValue: userData.email,
                                decoration: textInputDecoration,
                                readOnly: true,
                              ),
                              SizedBox(height: 10.0),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Name:"),
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                initialValue: userData.name,
                                decoration: textInputDecoration,
                                validator: (val) =>
                                val.isEmpty ? 'Update your name' : null,
                                onChanged: (val) =>
                                    setState(() => _currentName = val),
                              ),
                              SizedBox(height: 10.0),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Phone:")),
                              SizedBox(height: 10.0),
                              TextFormField(
                                initialValue: userData.phone,
                                decoration: textInputDecoration,
                                validator: (val) =>
                                val.isEmpty ? 'update your phone' : null,
                                onChanged: (val) =>
                                    setState(() => _currentPhone = val),
                              ),
                              SizedBox(height: 10.0),


                              RaisedButton(
                                  color: Colors.pink[400],
                                  child: Text(
                                    'Update',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    if (_formKey1.currentState.validate()) {
                                      await DataUser(uid: user.uid).updateUserData(
                                          snapshot.data.email,
                                          _currentName ?? snapshot.data.name,
                                          _currentPhone ?? snapshot.data.phone,
                                          snapshot.data.privilege,



                                      );
                                      Navigator.pop(context);
                                    }
                                  }),
                            ],
                          ),
                        ));




          }
          else{
            return Loading();
          }
        });
  }
}