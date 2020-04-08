import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/product.dart';
import 'package:talab_market/screens/producttile.dart';

class ProductList extends StatefulWidget {
  int visibility;
  ProductList({this.visibility});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {

    final products = Provider.of<List<ProductData>>(context) ?? [];

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(products: products[index],visibility: widget.visibility);
      },
    );
  }
}