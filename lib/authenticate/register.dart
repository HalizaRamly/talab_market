import 'package:flutter/material.dart';
import 'package:talab_market/services/auth.dart';
import 'package:talab_market/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  //final AuthService1 _auth = AuthService1();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  final AuthService _auth = AuthService();

  // text field state
  String name = '';
  String email = '';
  String password = '';
  String phone = '';
  String privilege = '';


  TextEditingController _textEditingController;
  int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        title: Text('Sign up to Talab App'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'name'),
                validator: (val) => val.isEmpty ? 'Enter your name' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Phone'),
                validator: (val) => val.isEmpty ? 'Enter an Phone' : null,
                onChanged: (val) {
                  setState(() => phone = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                obscureText: true,
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              new Text(
                'Choose Previlage:',
                style: new TextStyle(fontSize: 16.0,

                    color: Colors.white),
              ),
              Row(

                children: <Widget>[

                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  new Text(
                    'salesperson',
                    style: new TextStyle(fontSize: 16.0,
                    color: Colors.white),

                  ),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: Colors.blue,
                    onChanged: (val) {

                      setSelectedRadio(val);
                    },
                  ),
                  new Text(
                    'admin',
                    style: new TextStyle(fontSize: 16.0,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20.0),

              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                   setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                         email,
                         password,
                         name,
                        phone,
                       selectedRadio,

                        );
                   if (result == null) {
                       setState(() {
                          loading = false;
                        error = 'Please supply a valid email';
                     });
                    }
                    }
               }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
