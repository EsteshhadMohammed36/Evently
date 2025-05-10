import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning/models/event.dart';

class FirebaseService {
  static CollectionReference<Event> getEventsCollection() =>
      FirebaseFirestore.instance.collection("events").withConverter(
          fromFirestore: (snapshot, _) => Event.fromJson(snapshot.data()!),
          toFirestore: (event, _) => event.toJson());

  static Future<void> addEventsToFirestore(Event event) async {
    CollectionReference<Event> eventCollection = getEventsCollection();
    DocumentReference<Event> eventDocument = eventCollection.doc();
    event.id = eventDocument.id;
    await eventDocument.set(event);
  }

  static Future<List<Event>> getEventsFromFirestore() async {
    CollectionReference<Event> eventCollection = getEventsCollection();
    QuerySnapshot<Event> querySnapshot = await eventCollection.get();
    return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }
}
