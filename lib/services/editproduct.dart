
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProduct {

  final String id;
  EditProduct({this.id});


  // collection reference
  final CollectionReference talabCollection = Firestore.instance.collection('product');



  Future<void> deleteProductData() async {
    return await talabCollection.document(id).delete();
  }




// brew list from snapshot

// user data from snapshots



// get brews stream




}