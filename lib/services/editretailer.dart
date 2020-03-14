
import 'package:cloud_firestore/cloud_firestore.dart';

class EditRetailer {

  final String id;
  EditRetailer({this.id});


  // collection reference
  final CollectionReference talabCollection = Firestore.instance.collection('retailer');



  Future<void> deleteRetailerData() async {
    return await talabCollection.document(id).delete();
  }


// brew list from snapshot

// user data from snapshots



// get brews stream




}