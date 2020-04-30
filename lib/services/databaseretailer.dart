
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talab_market/models/retailer.dart';

class DataRetailer {




  // collection reference
  final CollectionReference talabCollection = Firestore.instance.collection('retailer');



  Future<void> updateRetailerData(String email, String name, String phone,String photo, var buy) async {


    final ffff= await talabCollection.add({
      'email': email,
      'name': name,
      'phone': phone,
      'photo':photo,
      'buy': buy,
    });
  return await talabCollection.document(ffff.documentID).updateData({
    'id': ffff.documentID}
  );

  }

  Future<void> deleteRetailerData() async {
    return await talabCollection.document().delete();
  }


  // brew list from snapshot

  // user data from snapshots

  List <RetailerData> _userDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return RetailerData(
        name: doc.data['name'] ?? "",
        email: doc.data['email'] ?? "",
        phone: doc.data['phone'] ?? "",
        photo: doc.data['photo'] ?? "",
        id : doc.data['id']?? "",

      );
    }).toList();
  }

  // get brews stream


  // get user doc stream
  Stream<List<RetailerData>>get retailerData {
    return talabCollection.orderBy("name").snapshots()
        .map(_userDataFromSnapshot);
  }


}