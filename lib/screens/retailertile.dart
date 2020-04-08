import 'package:flutter/material.dart';
import 'package:talab_market/models/retailer.dart';
import 'package:talab_market/screens/purchase.dart';
import 'package:talab_market/services/editretailer.dart';

class RetailerTile extends StatelessWidget {
  int visibility;

  final RetailerData retailers;


  RetailerTile({this.retailers, this.visibility,});

  @override
  Widget build(BuildContext context) {
    if (visibility == 2) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Purchase(
                              id: retailers.id,
                              name: retailers.name,
                              visibility: 2,
                            )));
              },
              child: ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(retailers.photo),
                    radius: 25.0,
                  ),
                  title: Text(retailers.name),
                  subtitle: Text('${retailers.phone} \n${retailers.email}'),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await EditRetailer(id: retailers.id)
                            .deleteRetailerData();
                      })),
            )),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(retailers.photo),
              radius: 25.0,
            ),
            title: Text(retailers.name),
            subtitle: Text('${retailers.phone} \n${retailers.email} '),
          ),
        ),
      );
    }
  }
}
