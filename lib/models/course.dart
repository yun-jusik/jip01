import 'dart:convert';

/// 코스 위치 정보
class Location {
  final double lat;
  final double lng;
  final int radius;
  final String address;

  Location({
    required this.lat,
    required this.lng,
    required this.radius,
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
      radius: json['radius'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng, 'radius': radius, 'address': address};
  }
}

/// 코스 미디어 정보
class Media {
  final String type;
  final String youtubeUrl;
  final String videoId;
  final String duration;
  final String thumbnailUrl;

  Media({
    required this.type,
    required this.youtubeUrl,
    required this.videoId,
    required this.duration,
    required this.thumbnailUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json['type'],
      youtubeUrl: json['youtubeUrl'],
      videoId: json['videoId'],
      duration: json['duration'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'youtubeUrl': youtubeUrl,
      'videoId': videoId,
      'duration': duration,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}

/// 코스 설명
class Description {
  final String title;
  final String subtitle;
  final String summary;

  Description({
    required this.title,
    required this.subtitle,
    required this.summary,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      title: json['title'],
      subtitle: json['subtitle'],
      summary: json['summary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'subtitle': subtitle, 'summary': summary};
  }
}

/// 체크리스트 항목
class ChecklistItem {
  final String id;
  final String title;
  final String criterion;
  final String result;
  final String status; // pass, check, fail
  final String importance; // high, medium, low
  final String detail;

  ChecklistItem({
    required this.id,
    required this.title,
    required this.criterion,
    required this.result,
    required this.status,
    required this.importance,
    required this.detail,
  });

  factory ChecklistItem.fromJson(Map<String, dynamic> json) {
    return ChecklistItem(
      id: json['id'],
      title: json['title'],
      criterion: json['criterion'],
      result: json['result'],
      status: json['status'],
      importance: json['importance'],
      detail: json['detail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'criterion': criterion,
      'result': result,
      'status': status,
      'importance': importance,
      'detail': detail,
    };
  }

  bool get isPassed => status == 'pass';
}

/// 코스 전체 정보
class Course {
  final String id;
  final String name;
  final Location location;
  final Media media;
  final Description description;
  final List<ChecklistItem> checklist;
  final List<String> highlights;
  final List<String> warnings;
  final String difficulty;
  final String estimatedTime;
  final List<String> tags;
  final String createdAt;
  final String updatedAt;
  final String version;

  Course({
    required this.id,
    required this.name,
    required this.location,
    required this.media,
    required this.description,
    required this.checklist,
    required this.highlights,
    required this.warnings,
    required this.difficulty,
    required this.estimatedTime,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  /// JSON에서 Course 객체 생성
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      location: Location.fromJson(json['location']),
      media: Media.fromJson(json['media']),
      description: Description.fromJson(json['description']),
      checklist: (json['checklist'] as List)
          .map((item) => ChecklistItem.fromJson(item))
          .toList(),
      highlights: List<String>.from(json['highlights']),
      warnings: List<String>.from(json['warnings']),
      difficulty: json['difficulty'],
      estimatedTime: json['estimatedTime'],
      tags: List<String>.from(json['tags']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['version'],
    );
  }

  /// JSON 문자열에서 Course 객체 생성
  factory Course.fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString);
    return Course.fromJson(json);
  }

  /// Course 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location.toJson(),
      'media': media.toJson(),
      'description': description.toJson(),
      'checklist': checklist.map((item) => item.toJson()).toList(),
      'highlights': highlights,
      'warnings': warnings,
      'difficulty': difficulty,
      'estimatedTime': estimatedTime,
      'tags': tags,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'version': version,
    };
  }

  /// Course 객체를 JSON 문자열로 변환
  String toJsonString() {
    return jsonEncode(toJson());
  }
}
