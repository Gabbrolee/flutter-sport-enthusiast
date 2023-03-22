import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? phoneNo;
  String? email;
  String? userName;
  String? password;
  String? userId;
  UserModel(
      { this.email,
      this.password,
       this.phoneNo,
       this.userName,
      this.userId});

  factory UserModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
        email: snapshot['email'],
        password: snapshot['password'],
        phoneNo: snapshot['phoneNo'],
        userName: snapshot['userName'],
        userId: snapshot['userId']
    );
  }

  Map<String, dynamic> toJson()=> {
      "PhoneNo": phoneNo,
      "Email": email,
      "UserName": userName,
      "Password": password,
      "userId": userId
  };
}
