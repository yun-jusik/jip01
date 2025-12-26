import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'youtube_player_screen.dart';

/// 홈 화면
///
/// 원칙 1: 설명하지 마라, 느끼게 하라
/// - 설명 없음
/// - 큰 버튼 1개
/// - 즉시 가치 전달
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 큰 버튼
            ElevatedButton(
              onPressed: () {
                // YouTube 플레이어 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YouTubePlayerScreen(
                      videoId: 'dQw4w9WgXcQ', // 테스트용 영상 ID
                      locationName: '성수동',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: AppTheme.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
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
