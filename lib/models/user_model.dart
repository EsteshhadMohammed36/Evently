class UserModel {
  String id;
  String name;
  String email;
  List<String> favEventsIds;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.favEventsIds});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            email: json['email'],
            name: json['name'],
            favEventsIds: []);

  Map<String, dynamic> toJson() =>
      {'id': id, 'email': email, 'name': name, 'favEventsIds': favEventsIds};
}
