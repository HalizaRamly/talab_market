import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/retailer.dart';
import 'package:talab_market/screens/retailertile.dart';

class ProductList extends StatefulWidget {
  int visibility;
  ProductList({this.visibility});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {

    final retailers = Provider.of<List<RetailerData>>(context) ?? [];

    return ListView.builder(
      itemCount: retailers.length,
      itemBuilder: (context, index) {
        return RetailerTile(retailers: retailers[index],visibility: widget.visibility);
      },
    );
  }
}