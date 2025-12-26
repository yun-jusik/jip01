import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../theme/app_theme.dart';

/// YouTube 플레이어 화면
///
/// 원칙 3: 흐름을 깨지 마라
/// - 자동 재생
/// - 중단 없음
/// - 몰입 유지
class YouTubePlayerScreen extends StatefulWidget {
  final String videoId;
  final String locationName;

  const YouTubePlayerScreen({
    super.key,
    required this.videoId,
    this.locationName = '성수동',
  });

  @override
  State<YouTubePlayerScreen> createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // YouTube 플레이어 초기화
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    // 영상 로드 및 자동 재생
    _controller.loadVideoById(videoId: widget.videoId);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
        title: Text(
          widget.locationName,
          style: TextStyle(
            fontSize: AppTheme.fontSizeTitle,
            fontWeight: FontWeight.w700,
            fontFamily: 'GmarketSans',
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // YouTube 플레이어 (최대 높이 제한)
              Container(
                constraints: BoxConstraints(maxHeight: 400),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: YoutubePlayer(
                    controller: _controller,
                    aspectRatio: 16 / 9,
                  ),
                ),
              ),

              SizedBox(height: AppTheme.spacingL),

              // 안내 텍스트
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Text(
                      '전문가가 안내해드려요',
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeTitle,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                        fontFamily: 'GmarketSans',
                      ),
                    ),

                    SizedBox(height: AppTheme.spacingM),

                    // 설명
                    Text(
                      '영상을 들으면서 걸어보세요.\n중요한 포인트를 하나씩 알려드릴게요.',
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeBody,
                        fontWeight: FontWeight.w300,
                        color: AppTheme.textSecondary,
                        fontFamily: 'GmarketSans',
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: AppTheme.spacingXL),

                    // 체크리스트 (나중에 동적으로)
                    _buildChecklistItem('지하철역 거리', '성수역 도보 7분', true),

                    SizedBox(height: AppTheme.spacingM),

                    _buildChecklistItem('대형마트', '이마트 성수점 10분', true),

                    SizedBox(height: AppTheme.spacingM),

                    _buildChecklistItem('학교', '서울숲초등학교 확인 필요', false),

                    SizedBox(height: AppTheme.spacingXL),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 체크리스트 아이템
  Widget _buildChecklistItem(String title, String detail, bool isPassed) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 아이콘
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isPassed ? AppTheme.primary : AppTheme.accent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              isPassed ? Icons.check : Icons.question_mark,
              color: AppTheme.white,
              size: 16,
            ),
          ),
        ),

        SizedBox(width: AppTheme.spacingM),

        // 텍스트
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: AppTheme.fontSizeBody,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                  fontFamily: 'GmarketSans',
                ),
              ),
              SizedBox(height: 4),
              Text(
                detail,
                style: TextStyle(
                  fontSize: AppTheme.fontSizeSmall,
                  fontWeight: FontWeight.w300,
                  color: AppTheme.textSecondary,
                  fontFamily: 'GmarketSans',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
