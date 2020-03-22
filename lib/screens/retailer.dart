import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/retailer.dart';
import 'package:talab_market/screens/addretailer.dart';
import 'package:talab_market/screens/retailerlist.dart';
import 'package:talab_market/services/databaseretailer.dart';

class Retailer extends StatefulWidget {

 final int visibility;


  Retailer({this.visibility,});
  @override
  RetailerState createState() => RetailerState();
}

class RetailerState extends State<Retailer> {
  final _formKey1 = GlobalKey<FormState>();

  // form values

  @override
  Widget build(BuildContext context) {
    bool fort;
    if(widget.visibility==1){
      fort= false;
    }
    else{
      fort= true;
    }
    return StreamProvider<List<RetailerData>>.value(
        value: DataRetailer().retailerData,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("Rtailer"),
          ),
          body: Center(child: RetailerList(visibility:widget.visibility, )),

          floatingActionButton:
          Visibility(
            visible:fort ,
            child:           FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                        child: Addretailer(),
                      );
                    });
                // Add your onPressed code here!
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
          )

        ));
  }
}
