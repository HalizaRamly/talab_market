
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talab_market/models/product.dart';

class DataProduct {




  // collection reference
  final CollectionReference talabCollection = Firestore.instance.collection('product');



  Future<void> updateProductData( String name, int quantity,String photo, double price) async {


    final ffff= await talabCollection.add({

      'name': name,
      'quantity': quantity,
      'photo':photo,
      'price': price
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

  List <ProductData> _userDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ProductData(
        name: doc.data['name'] ?? "",
        quantity: doc.data['quantity'],
        price: doc.data['price'],

        photo: doc.data['photo'] ?? "",
        id : doc.data['id']?? "",

      );
    }).toList();
  }

  // get brews stream


  // get user doc stream
  Stream<List<ProductData>>get productData{
    return talabCollection.orderBy("name").snapshots()
        .map(_userDataFromSnapshot);
  }


}