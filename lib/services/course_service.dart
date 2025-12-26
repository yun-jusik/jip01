import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../models/course.dart';

/// 코스 데이터 관리 서비스
///
/// 원칙: 코드 수정 0줄로 새 코스 추가
/// - assets/courses/*.json 파일만 추가
/// - 자동으로 인식 및 로드
class CourseService {
  static final CourseService _instance = CourseService._internal();
  factory CourseService() => _instance;
  CourseService._internal();

  // 로드된 모든 코스
  final Map<String, Course> _courses = {};

  // 로드 완료 여부
  bool _isLoaded = false;

  /// 모든 코스 가져오기
  List<Course> get allCourses => _courses.values.toList();

  /// 코스 ID로 가져오기
  Course? getCourseById(String id) => _courses[id];

  /// 로드 완료 여부
  bool get isLoaded => _isLoaded;

  /// 모든 코스 로드
  Future<void> loadAllCourses() async {
    if (_isLoaded) return;

    try {
      // 현재는 seongsu.json만 로드
      // 나중에 여러 코스 자동 감지 추가 가능
      final courseIds = ['seongsu'];

      for (final id in courseIds) {
        try {
          final course = await _loadCourse(id);
          _courses[course.id] = course;
        } catch (e) {
          // ignore: avoid_print
          print('코스 로드 실패: $id - $e');
        }
      }

      _isLoaded = true;
      // ignore: avoid_print
      print('✅ ${_courses.length}개 코스 로드 완료');
    } catch (e) {
      // ignore: avoid_print
      print('❌ 코스 로드 에러: $e');
      rethrow;
    }
  }

  /// 특정 코스 로드
  Future<Course> _loadCourse(String id) async {
    final jsonString = await rootBundle.loadString('assets/courses/$id.json');
    return Course.fromJsonString(jsonString);
  }

  /// 가장 가까운 코스 찾기 (나중에 GPS 연동)
  Course? findNearestCourse({
    required double userLat,
    required double userLng,
  }) {
    if (_courses.isEmpty) return null;

    Course? nearest;
    double minDistance = double.infinity;

    for (final course in _courses.values) {
      final distance = _calculateDistance(
        userLat,
        userLng,
        course.location.lat,
        course.location.lng,
      );

      if (distance < minDistance) {
        minDistance = distance;
        nearest = course;
      }
    }

    return nearest;
  }

  /// 두 좌표 사이 거리 계산 (미터)
  double _calculateDistance(
    double lat1,
    double lng1,
    double lat2,
    double lng2,
  ) {
    const earthRadius = 6371000.0; // 미터
    final dLat = _toRadians(lat2 - lat1);
    final dLng = _toRadians(lng2 - lng1);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLng / 2) *
            sin(dLng / 2);

    final c = 2 * asin(sqrt(a));
    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * pi / 180.0;

  /// 코스 캐시 초기화 (개발용)
  void clearCache() {
    _courses.clear();
    _isLoaded = false;
  }
}
