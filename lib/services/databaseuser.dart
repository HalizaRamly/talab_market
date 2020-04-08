import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talab_market/models/user.dart';

class DataUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final String uid;

  DataUser({ this.uid });

  // collection reference
  final CollectionReference talabCollection = Firestore.instance.collection('Users');
  Future <String> inputData() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    return uid;
    // here you write the codes to input the data into firestore
  }


  Future<void> updateUserData(String email, String name, String phone, int privilege,) async {
    return await talabCollection.document(uid).setData({
      'email': email,
      'name': name,
      'phone': phone,
      'privilege': privilege,


    });
  }




  // brew list from snapshot

  // user data from snapshots

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {

    return UserData(
        uid: uid,
        name: snapshot.data['name']??"",
        email: snapshot.data['email']??"",
        phone: snapshot.data['phone']??"",
        privilege : snapshot.data['privilege']??"",

    );
  }

  // get brews stream


  // get user doc stream
  Stream<UserData> get userData {
    return talabCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }


}