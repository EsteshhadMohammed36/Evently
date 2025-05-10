import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning/models/category.dart';

class Event {
  String id;
  String title;
  String description;
  DateTime dateTime;
  Category category;

  Event(
      {this.id = '',
      required this.title,
      required this.description,
      required this.dateTime,
      required this.category});

  Event.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            dateTime: (json['timestamp'] as Timestamp).toDate(),
            category: Category.categories
                .firstWhere((category) => json['categoryId'] == category.id));

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'categoryId': category.id,
        'timestamp': Timestamp.fromDate(dateTime)
      };
}
