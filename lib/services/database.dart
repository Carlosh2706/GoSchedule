import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:startup_database/models/brew.dart';
import 'package:startup_database/user.dart';


class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //Collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  //Change values to fit the employees!!!
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength
    });
  }

  //Change values to fit the employees!!
  //Brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Brew(
          name: doc.data()['name'] ?? '',
          strength: doc.data()['strength'] ?? 0,
          sugars: doc.data()['sugars'] ?? '0'
      );
    }).toList();
  }

  //User data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      sugars: snapshot.data()['sugars'],
      strength: snapshot.data()['strength'],
    );
  }

  //Get brew streams
  //Change values to fit the employees!!
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //Get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}