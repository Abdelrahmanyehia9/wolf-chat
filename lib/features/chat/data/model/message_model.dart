import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {

  final String text ;
  final Timestamp time ;

  MessageModel(this.text, this.time);

  
  factory MessageModel.fromJson(json){
    return MessageModel(json["text"]  , json["time"]);
  }
}