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

class ApiResponse extends Equatable {
  final int verbId;
  final String name;
  final bool enabled;
  final bool listDisabled;
  final Program program;

  const ApiResponse({
    required this.verbId,
    required this.name,
    required this.enabled,
    required this.listDisabled,
    required this.program,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      verbId: json['verbId'],
      name: json['name'],
      enabled: json['enabled'],
      listDisabled: json['listDisabled'],
      program: Program.fromJson(json['program']),
    );
  }

  @override
  List<Object?> get props => [
        verbId,
        name,
        enabled,
        listDisabled,
        program,
      ];
}

class Program extends Equatable {
  final List<String> videoUrls;

  const Program({required this.videoUrls});

  factory Program.fromJson(Map<String, dynamic> json) {
    List<String> videoUrls = [];
    json['videos'].forEach((key, value) {
      videoUrls.add(value);
    });
    return Program(videoUrls: videoUrls);
  }
  @override
  List<Object> get props => [videoUrls];
}
