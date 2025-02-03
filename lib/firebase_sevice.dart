import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning/models/event_model.dart';
import 'package:event_planning/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static CollectionReference<EventModel> getEventsCollection() =>
      FirebaseFirestore.instance.collection("events").withConverter(
          fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
          toFirestore: (event, _) => event.toJson());

  static CollectionReference<UserModel> getUsersCollection() =>
      FirebaseFirestore.instance.collection("users").withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson());

  static Future<void> addEventsToFirestore(EventModel event) async {
    CollectionReference<EventModel> eventCollection = getEventsCollection();
    DocumentReference<EventModel> eventDocument = eventCollection.doc();
    event.id = eventDocument.id;
    await eventDocument.set(event);
  }

  static Future<List<EventModel>> getEventsFromFirestore() async {
    CollectionReference<EventModel> eventCollection = getEventsCollection();
    QuerySnapshot<EventModel> querySnapshot = await eventCollection.get();
    return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  static Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    //create user in firebase auth
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // create user object to store it in firestore
    UserModel user =
        UserModel(id: credential.user!.uid, name: name, email: email);
    // add user to firestore
    CollectionReference<UserModel> userCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument =
        userCollection.doc(credential.user!.uid);
    userDocument.set(user);
  }

  static Future<UserModel> login(
      {required String email, required String password}) async {
    //sign in with created user
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    //get stored user from firestore
    CollectionReference<UserModel> userCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument =
        userCollection.doc(credential.user!.uid);
    DocumentSnapshot<UserModel> docSnapshot = await userDocument.get();
    return docSnapshot.data()!;
  }

  static Future<void> signOut() => FirebaseAuth.instance.signOut();
}
