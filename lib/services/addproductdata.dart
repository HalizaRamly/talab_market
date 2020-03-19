
import 'package:cloud_firestore/cloud_firestore.dart';

class Addproductdata {

  final String id;

  Addproductdata({this.id});


  // collection reference
  final CollectionReference talabCollection = Firestore.instance.collection('retailer');



  Future<void> updatesellData(var sell) async {
    return await talabCollection.document(id).updateData({

      'buy': FieldValue.arrayUnion(sell)
    });
  }

// brew list from snapshot

// user data from snapshots



// get brews stream




}