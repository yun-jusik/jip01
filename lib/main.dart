import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const JipApp());
}

/// 집결정 앱
class JipApp extends StatelessWidget {
  const JipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 앱 이름
      title: '집결정',

      // 테마 적용
      theme: AppTheme.lightTheme,

      // 디버그 배너 숨기기
      debugShowCheckedModeBanner: false,

      // 홈 화면 설정
      home: const HomeScreen(),
    );
  }
}
