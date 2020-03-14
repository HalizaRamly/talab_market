import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talab_market/models/retailer.dart';
import 'package:talab_market/screens/retailertile.dart';

class RetailerList extends StatefulWidget {
  int visibility;
  RetailerList({this.visibility});

  @override
  _RetailerListState createState() => _RetailerListState();
}

class _RetailerListState extends State<RetailerList> {
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