import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talab_market/models/product.dart';
import 'package:talab_market/services/addproductdata.dart';
import 'package:talab_market/services/decreaseproduct.dart';

class PurchaseTile extends StatefulWidget {
  final int visibility;
  final String id;

  final ProductData products;

  PurchaseTile({this.products, this.visibility, this.id});

  @override
  _PurchaseTileState createState() => _PurchaseTileState();
}

class _PurchaseTileState extends State<PurchaseTile> {
  var _itemCount = 0;
  var total;

  Widget build(BuildContext context) {

    if (_itemCount == 0) {
      total = 0;
    }
    num balance = widget.products.quantity - _itemCount;
    print (balance);

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
                      backgroundImage: CachedNetworkImageProvider(widget.products.photo, ),

                      radius: 25.0,
                    ),
                    title: Text(widget.products.name),
                    subtitle:
                        Text('price: $total'),
                    trailing: IconButton(
                        icon: Icon(Icons.check_circle),
                        onPressed: () async {
                          if(_itemCount==0)
                            return null;
                         await Addproductdata(
                            id: widget.id,
                          ).updatesellData([{"id":widget.products.id, "name":widget.products.name,"price":widget.products.price,"quantity":widget.products.quantity}]);
                         await Decreaseproduct(id: widget.products.id).updateproductData(balance);
    setState(() {
      _itemCount = 0;

                         });




                        })),
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _itemCount != 0
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
                        if(_itemCount<widget.products.quantity)
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
              backgroundImage: CachedNetworkImageProvider(widget.products.photo),
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
