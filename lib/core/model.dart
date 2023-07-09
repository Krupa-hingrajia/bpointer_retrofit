import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class User {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  User({this.userId, this.id, this.title, this.completed});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}



@JsonSerializable()
class CardList {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  CardList({this.userId, this.id, this.title, this.completed});

  factory CardList.fromJson(Map<String, dynamic> json) {
    return CardList(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}