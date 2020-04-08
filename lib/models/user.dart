class User {

  final String uid;

  User({ this.uid });

}

class UserData {

  final String uid;
  final String name;
  final String email;
  final String phone;
  final int privilege;


  UserData({ this.uid, this.email, this.phone, this.name,this.privilege});
}