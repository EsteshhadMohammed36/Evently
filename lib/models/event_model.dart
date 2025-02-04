import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning/models/category_model.dart';

class EventModel {
  String id;
  String title;
  String description;
  DateTime dateTime;
  CategoryModel category;

  EventModel(
      {this.id = '',
      required this.title,
      required this.description,
      required this.dateTime,
      required this.category});

  EventModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            dateTime: (json['timestamp'] as Timestamp).toDate(),
            category: CategoryModel.categories
                .firstWhere((category) => json['categoryId'] == category.id));

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'categoryId': category.id,
        'timestamp': Timestamp.fromDate(dateTime)
      };
}
