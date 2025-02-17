import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning/models/category_model.dart';

class EventModel {
  String id;
  String title;
  String description;
  DateTime dateTime;
  CategoryModel category;
  String userId;

  EventModel(
      {this.id = '',
      required this.userId,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.category});

  EventModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            userId: json['userId'],
            title: json['title'],
            description: json['description'],
            dateTime: (json['timestamp'] as Timestamp).toDate(),
            category: CategoryModel.categories
                .firstWhere((category) => json['categoryId'] == category.id));

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'description': description,
        'categoryId': category.id,
        'timestamp': Timestamp.fromDate(dateTime)
      };
}
