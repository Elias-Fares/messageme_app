import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User signedInUser;
  late TextEditingController message ;
  List<String>? messagesText ;
  Map<String,dynamic>? messagesInfo ;

  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void signOut()  {
    _auth.signOut();
    // ===========signout() dont need await========
    // The signOut() method in the firebase_auth package in Flutter does not need await because it is a void method. Void methods do not return any value, so there is no need to wait for them to finish executing.
    Get.toNamed("/");
    print("You are signed out now");
  }

  void send ()async{
    await _firestore.collection("messages").add({
      'sender': signedInUser.email,
      'text': message.text,
      'time' : FieldValue.serverTimestamp()
    });
    print("the message is sent");
    message.clear();
    update();
  }

  // void messagesStream () async {
  //   await for (var snapshot in _firestore.collection("messages").snapshots()){
  //     for (var item in snapshot.docs){
  //      print(item.data());
  //     }
  //   }
  // }
  Stream<QuerySnapshot<Object?>>? getStream(){
    return _firestore.collection('messages').orderBy('time').snapshots();
  }

  @override
  void onInit() {
    print("=================ChatController is initialised================");
    message = TextEditingController();
    getCurrentUser();
    super.onInit();
  }
}
