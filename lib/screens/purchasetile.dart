import 'package:flutter/material.dart';
import 'package:talab_market/models/product.dart';
import 'package:talab_market/screens/addproduct.dart';
import 'package:talab_market/services/editproduct.dart';
import 'package:talab_market/models/retailer.dart';
import 'package:talab_market/services/editretailer.dart';
import 'package:talab_market/services/addproductdata.dart';

class PurchaseTile extends StatefulWidget {
  final int visibility;
  final String id;

  final ProductData products;

  PurchaseTile({this.products, this.visibility, this.id});

  @override
  _PurchaseTileState createState() => _PurchaseTileState();
}

class _PurchaseTileState extends State<PurchaseTile> {
  var _itemCount = 1;
  var total;

  Widget build(BuildContext context) {
    print(widget.id);
    if (_itemCount == 1) {
      total = widget.products.price;
    }

    if (widget.visibility == 2) {
      return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: ListTile(
                    isThreeLine: true,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(widget.products.photo),
                      radius: 25.0,
                    ),
                    title: Text(widget.products.name),
                    subtitle:
                        Text('${widget.products.quantity}\nprice: $total'),
                    trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () async {
                          Addproductdata(
                            id: widget.id,
                          ).updatesellData([{"id":widget.products.id, "name":widget.products.name,"price":widget.products.price,"quantity":widget.products.quantity}]);
                        })),
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _itemCount != 1
                      ? new IconButton(
                          icon: new Icon(Icons.remove),
                          onPressed: () => setState(() {
                            _itemCount--;
                            total = (_itemCount * widget.products.price)
                                .toStringAsFixed(1);
                          }),
                        )
                      : new Container(),
                  new Text(_itemCount.toString()),
                  new IconButton(
                      icon: new Icon(Icons.add),
                      onPressed: () => setState(() {
                            _itemCount++;
                            total = (_itemCount * widget.products.price)
                                .toStringAsFixed(1);
                          }))
                ],
              )),
            ],
          ));
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.products.photo),
              radius: 25.0,
            ),
            title: Text(widget.products.name),
            subtitle: Text('${widget.products.quantity} '),
          ),
        ),
      );
    }
  }
}
