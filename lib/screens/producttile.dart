import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talab_market/models/product.dart';
import 'package:talab_market/services/decreaseproduct.dart';
import 'package:talab_market/services/editproduct.dart';

class ProductTile extends StatelessWidget {
  int visibility;


  final ProductData products;

  ProductTile({ this.products , this.visibility});

  @override
  Widget build(BuildContext context) {
    bool fort;
    if(products.quantity==0){
      fort= true;
    }
    else{
      fort= false;
    }

    if(visibility==1){
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
              isThreeLine:true,
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(products.photo),
                radius: 25.0,

              ),
              title: Text(products.name),
              subtitle: Text('Quantity: ${products.quantity}\nUnit price: ${products.price}' ),


              trailing:
              Column(
                children: <Widget>[
                Visibility(
                visible:fort ,
                    child:
               Expanded(child:



          IconButton(
          icon: Icon(Icons.delete),
          onPressed: () async {
          await EditProduct(id:products.id).deleteProductData();


          }),


               ) ),
                  Expanded(child:
                  new IconButton(
                      icon: new Icon(Icons.add),
                      onPressed: () {
                        Decreaseproduct(id: products.id).updateproductData(products.quantity+1);
                      }

                  ),
                  ) ,
                ],
              )



          ),
        ),
      );
    }
    else{
print(products.price);
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            isThreeLine:true,
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(products.photo),
              radius: 25.0,


            ),
            title: Text(products.name),
            subtitle: Text('Quantity: ${products.quantity}\nunit price: ${products.price}' ),



          ),
        ),
      );
    }
  }
}