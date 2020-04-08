
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talab_market/models/retailer.dart';

class EditRetailer {

  final String id;
  EditRetailer({this.id});


  // collection reference
  final CollectionReference talabCollection = Firestore.instance.collection('retailer');



  Future<void> deleteRetailerData() async {
    return await talabCollection.document(id).delete();
  }
  RetailerData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return RetailerData(
        id: id,
        name: snapshot.data['name']??"",
        email: snapshot.data['email']??"",
        phone: snapshot.data['phone']??"",
      photo: snapshot.data['photo'],
      buy: snapshot.data['buy']

    );
  }

  // get brews stream


  // get user doc stream
  Stream<RetailerData> get userData {
    return talabCollection.document(id).snapshots()
        .map(_userDataFromSnapshot);
  }

// brew list from snapshot

// user data from snapshots



// get brews stream




}