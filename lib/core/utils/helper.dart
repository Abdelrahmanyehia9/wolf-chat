import 'package:cloud_firestore/cloud_firestore.dart';
Future <void> deleteChat()async{
  final collection = await FirebaseFirestore.instance
      .collection("chats")
      .get();

  final batch = FirebaseFirestore.instance.batch();

  for (final doc in collection.docs) {
    batch.delete(doc.reference);
  }

  return batch.commit();
}