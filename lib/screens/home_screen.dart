import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/course_service.dart';
import 'youtube_player_screen.dart';

/// 홈 화면
///
/// 원칙 1: 설명하지 마라, 느끼게 하라
/// - 설명 없음
/// - 큰 버튼 1개
/// - 즉시 가치 전달
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _courseService = CourseService();
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    try {
      await _courseService.loadAllCourses();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = '코스 로드 실패: $e';
      });
    }
  }

  void _startCourse() {
    // 성수동 코스 가져오기
    final course = _courseService.getCourseById('seongsu');

    if (course == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('코스를 찾을 수 없습니다')));
      return;
    }

    // YouTube 플레이어 화면으로 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YouTubePlayerScreen(
          videoId: course.media.videoId,
          locationName: course.name,
          course: course, // Course 객체 전달!
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
              )
            : _errorMessage.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeBody,
                      color: AppTheme.accent,
                    ),
                  ),
                  SizedBox(height: AppTheme.spacingL),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                        _errorMessage = '';
                      });
                      _loadCourses();
                    },
                    child: const Text('다시 시도'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 큰 버튼
                  ElevatedButton(
                    onPressed: _startCourse,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: AppTheme.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusL),
                      ),
                    ),
                    child: Text(
                      '지금 여기서 임장 시작하기',
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeHero,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'GmarketSans',
                      ),
                    ),
                  ),

                  SizedBox(height: AppTheme.spacingL),

                  // 부가 설명 (최소한!)
                  Text(
                    '켜놓고 걸으면 전문가가 속삭여요',
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeBody,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.textSecondary,
                      fontFamily: 'GmarketSans',
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
