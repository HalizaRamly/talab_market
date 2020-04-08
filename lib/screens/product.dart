import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/product.dart';
import 'package:talab_market/screens/addproduct.dart';
import 'package:talab_market/screens/productlist.dart';
import 'package:talab_market/services/databaseproduct.dart';

class Product extends StatefulWidget {

  int visibility;

  Product({this.visibility});
  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> {
  final _formKey1 = GlobalKey<FormState>();

  // form values

  @override
  Widget build(BuildContext context) {
    bool fort;
    if(widget.visibility==2){
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
            body: Center(child: ProductList(visibility:widget.visibility)),

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
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
            )

        ));
  }
}
