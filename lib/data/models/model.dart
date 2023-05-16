import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final bool status;
  final String message;
  final List<Data> data;

  const Categories(
      {required this.status, required this.message, required this.data});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      status: json['status'],
      message: json['message'],
      data: List<Data>.from(json['data'].map((item) => Data.fromJson(item))),
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}

class Data extends Equatable {
  final int id;
  final String avatar;
  final String name;
  final String type;
  final bool enabled;

  const Data({
    required this.id,
    required this.avatar,
    required this.name,
    required this.type,
    required this.enabled,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      avatar: json['avatar'],
      name: json['name'],
      type: json['type'],
      enabled: json['enabled'],
    );
  }

  @override
  List<Object?> get props => [id, avatar, name, type, enabled];
}
