import 'package:flutter/material.dart';

/// 집결정 앱 테마
///
/// 원칙: 심플하고 명확하게
/// - 색상 3개만
/// - 폰트 크기 4개만
/// - 간격 4개
/// - 라운드 2개
class AppTheme {
  // ========================================
  // 색상 시스템 (3개만!)
  // ========================================

  /// 메인 색상 - 청록색 (신뢰감, 야외 가독성 우수)
  static const Color primary = Color(0xFF1BA896);

  /// 강조 색상 - 주황-빨강 (경고, 중요 정보)
  static const Color accent = Color(0xFFE5675A);

  /// 배경 색상 - 밝은 회색
  static const Color background = Color(0xFFF8F9FA);

  /// 텍스트 색상
  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF6C757D);

  /// 기타
  static const Color white = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE9ECEF);

  // ========================================
  // 간격 시스템 (4개만!)
  // ========================================

  static const double spacingS = 8.0;
  static const double spacingM = 12.0;
  static const double spacingL = 16.0;
  static const double spacingXL = 20.0;

  // ========================================
  // 라운드 코너 (2개만!)
  // ========================================

  static const double radiusM = 12.0;
  static const double radiusL = 16.0;

  // ========================================
  // 폰트 크기 (4개만!)
  // ========================================

  static const double fontSizeHero = 28.0; // 큰 버튼
  static const double fontSizeTitle = 20.0; // 제목
  static const double fontSizeBody = 16.0; // 본문
  static const double fontSizeSmall = 12.0; // 부가정보

  // ========================================
  // 테마 생성 (라이트 모드만!)
  // ========================================

  static ThemeData get lightTheme {
    return ThemeData(
      // 기본 설정
      useMaterial3: true,
      brightness: Brightness.light,

      // 색상 스키마
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: accent,
        surface: white,
        error: accent,
      ),

      // 배경색
      scaffoldBackgroundColor: background,

      // 폰트 패밀리
      fontFamily: 'GmarketSans',

      // 텍스트 테마 (심플하게!)
      textTheme: TextTheme(
        // Hero - 큰 버튼, 중요한 메시지
        displayLarge: TextStyle(
          fontSize: fontSizeHero,
          fontWeight: FontWeight.w700, // Bold
          color: textPrimary,
          height: 1.2,
        ),

        // Title - 화면 제목, 섹션 제목
        titleLarge: TextStyle(
          fontSize: fontSizeTitle,
          fontWeight: FontWeight.w700, // Bold
          color: textPrimary,
          height: 1.3,
        ),

        // Body - 본문, 설명
        bodyLarge: TextStyle(
          fontSize: fontSizeBody,
          fontWeight: FontWeight.w500, // Medium
          color: textPrimary,
          height: 1.5,
        ),

        // Small - 부가 정보, 보조 텍스트
        bodySmall: TextStyle(
          fontSize: fontSizeSmall,
          fontWeight: FontWeight.w300, // Light
          color: textSecondary,
          height: 1.4,
        ),
      ),

      // 버튼 테마
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: white,
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: spacingXL,
            vertical: spacingL,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusL),
          ),
          textStyle: TextStyle(
            fontSize: fontSizeTitle,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // 카드 테마
      cardTheme: CardThemeData(
        color: white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusM),
        ),
        margin: EdgeInsets.all(spacingM),
      ),

      // AppBar 테마
      appBarTheme: AppBarTheme(
        backgroundColor: white,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: fontSizeTitle,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          fontFamily: 'GmarketSans',
        ),
      ),
    );
  }
}
