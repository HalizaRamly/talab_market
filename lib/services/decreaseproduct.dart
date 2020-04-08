
import 'package:cloud_firestore/cloud_firestore.dart';

class Decreaseproduct {

  final String id;

  Decreaseproduct({this.id});


  // collection reference
  final CollectionReference talabCollection = Firestore.instance.collection('product');



  Future<void> updateproductData(var quantity) async {
    return await talabCollection.document(id).updateData({

      'quantity': quantity
    });
  }

// brew list from snapshot

// user data from snapshots



// get brews stream




}