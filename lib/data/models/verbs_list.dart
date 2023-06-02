import 'package:equatable/equatable.dart';

class VerbsList extends Equatable {
  final int verbId;
  final String avatar;
  final String name;
  final bool enabled;
  final bool listDisabled;

  const VerbsList({
    required this.verbId,
    required this.avatar,
    required this.name,
    required this.enabled,
    required this.listDisabled,
  });

  @override
  List<Object?> get props => [verbId, avatar, name, enabled, listDisabled];

  factory VerbsList.fromJson(Map<String, dynamic> json) {
    return VerbsList(
      verbId: json['verbId'],
      avatar: json['avatar'],
      name: json['name'],
      enabled: json['enabled'],
      listDisabled: json['listDisabled'],
    );
  }
}
