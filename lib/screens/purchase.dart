import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/product.dart';
import 'package:talab_market/screens/addproduct.dart';
import 'package:talab_market/screens/producttile.dart';
import 'package:talab_market/screens/productlist.dart';
import 'package:talab_market/screens/purchaselist.dart';
import 'package:talab_market/services/databaseproduct.dart';

class Purchase extends StatefulWidget {

  int visibility;
  String id;

  Purchase({this.id,this.visibility});
  @override
  PurchaseState createState() => PurchaseState();
}

class PurchaseState extends State<Purchase> {
  final _formKey1 = GlobalKey<FormState>();

  // form values

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    bool fort;
    if(widget.visibility==1){
      fort= false;
    }
    else{
      fort= true;
    }
    return StreamProvider<List<ProductData>>.value(
        value: DataProduct().productData,
        child: Scaffold(
            appBar: new AppBar(
              title: new Text("Product"),
            ),
            body: Center(child: PurchaseList(visibility:widget.visibility,id:widget.id)),

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
                          child: Addproduct(),
                        );
                      });
                  // Add your onPressed code here!
                },
                child: Icon(Icons.check_circle),
                backgroundColor: Colors.green,
              ),
            )

        ));
  }
}
