import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/product.dart';
import 'package:talab_market/screens/purchasetile.dart';

class PurchaseList extends StatefulWidget {
  final int visibility;
  final id;
  PurchaseList({this.visibility,this.id});

  @override
  _PurchaseListState createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);

    final products = Provider.of<List<ProductData>>(context) ?? [];

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return PurchaseTile(products: products[index],visibility: widget.visibility,id:widget.id);
      },
    );
  }
}