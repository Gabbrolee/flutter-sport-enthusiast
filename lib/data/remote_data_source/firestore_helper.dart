import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sport_enthusiast/data/models/user_model.dart';

class FirestoreHelper {

 static Future create(UserModel user) async{
   final userCollection = FirebaseFirestore.instance.collection("users");

   final uid = userCollection.doc().id;
   final docRef = userCollection.doc(uid);

   final newUser = UserModel(
     userId:  uid,
     userName: user.userName,
     email: user.email,
     password: user.password,
     phoneNo: user.phoneNo,
   ).toJson();

   try {
     await docRef.set(newUser);
   }catch (e){
     print("some error occured $e");
   }
 }

 static Future update(UserModel user) async {
   final userCollection = FirebaseFirestore.instance.collection("users");

   final docRef = userCollection.doc(user.userId);

   final newUser = UserModel(
     userId: user.userId,
     userName: user.userName,
     phoneNo: user.phoneNo,
     email: user.email,
     password: user.password,
   ).toJson();

   try {
     await docRef.update(newUser);
   }catch (e){
     print("Some error occured $e");
   }
 }
}