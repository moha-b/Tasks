import 'package:equatable/equatable.dart';

class Verb extends Equatable {
  final int verbId;
  final String? avatar;
  final String name;
  final bool enabled;
  final bool listDisabled;
  final Map<String, String> videos;

  const Verb({
    required this.verbId,
    this.avatar,
    required this.name,
    required this.enabled,
    required this.listDisabled,
    required this.videos,
  });

  factory Verb.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> jsonVideos =
        json['program']['videos'] as Map<String, dynamic>;
    final Map<String, String> videos =
        jsonVideos.map((key, value) => MapEntry(key, value as String));

    return Verb(
      verbId: json['verbId'] as int,
      avatar: json['avatar'] as String?,
      name: json['name'] as String,
      enabled: json['enabled'] as bool,
      listDisabled: json['listDisabled'] as bool,
      videos: videos,
    );
  }

  @override
  List<Object?> get props =>
      [verbId, avatar, name, enabled, listDisabled, videos];
}
