# 집결정 (Jip01)

> **30대 여성을 위한 GPS 기반 임장 가이드**  
> "켜놓고 걸으면 전문가가 속삭여요"

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

---

## 🎯 프로젝트 소개

**집결정**은 집 보러 갈 때 느끼는 "판단의 외로움"을 해소하는 앱입니다.

### 핵심 가치
```
문제: "집 보러 갈 때 뭘 봐야 할지 모르겠어요 😢"
해결: "지금 여기서 임장 시작하기" [버튼 1개]
```

- **GPS 자동 감지**: 현재 위치 파악
- **YouTube 가이드**: 전문가 음성 안내
- **판단 기준 제공**: "이래서 좋아요" (확신)
- **Hands-free**: 걸으면서 듣기

---

## 👤 타겟 사용자

- 30대 여성 직장인
- 6개월 내 이사 예정
- 부동산 초보
- 실거주 목적 (투자 X)

---

## 🚀 현재 상태 (MVP)

### ✅ 완료

- [x] 프로젝트 구조 설계
- [x] 디자인 시스템 (색상, 폰트, 간격)
- [x] 홈 화면 (큰 버튼 1개)
- [x] 웹 테스트 성공
- [x] PRINCIPLES.md (1050줄)

### 🚧 진행 중

- [ ] YouTube 플레이어 화면
- [ ] GPS 자동 감지
- [ ] 성수동 코스 데이터
- [ ] 오디오 대본 작성

### 📅 계획

- **Week 1-2**: MVP 완성 (코스 1개, 10명 테스트)
- **Week 3-4**: 코스 3개 추가, 베타 테스트
- **Month 2**: 프리미엄 기능, App Store 출시

---

## 🎨 디자인 시스템

### 색상

- **Primary**: `#1BA896` (청록색) - 신뢰감, 야외 가독성
- **Accent**: `#E5675A` (주황-빨강) - 강조, 경고
- **Background**: `#F8F9FA` (밝은 회색)

### 폰트

- **GmarketSans** (Bold/Medium/Light)
- 크기: 28/20/16/12px (4개만!)

### 원칙

1. **설명하지 마라, 느끼게 하라**
2. **판단을 요구하지 마라, 안심시켜라**
3. **흐름을 깨지 마라, 유지하라**

자세한 내용: [PRINCIPLES.md](PRINCIPLES.md)

---

## 🛠️ 기술 스택

- **Framework**: Flutter (Dart)
- **미디어**: YouTube API
- **위치**: Geolocator
- **버전 관리**: Git/GitHub
- **개발 환경**: CURSOR

### 패키지
```yaml
dependencies:
  flutter:
    sdk: flutter
  youtube_player_flutter: ^8.1.2  # YouTube 재생
  geolocator: ^10.1.0              # GPS
  permission_handler: ^11.0.1      # 권한
```

---

## 📁 프로젝트 구조
```
jip01/
├── lib/
│   ├── main.dart              # 앱 시작점
│   ├── theme/
│   │   └── app_theme.dart     # 디자인 시스템
│   ├── models/
│   │   └── course.dart        # 코스 데이터 모델
│   ├── services/
│   │   ├── course_service.dart    # 코스 자동 로드
│   │   ├── gps_service.dart       # GPS
│   │   └── youtube_service.dart   # YouTube
│   └── screens/
│       ├── home_screen.dart           # 홈
│       └── youtube_player_screen.dart # 플레이어
│
├── assets/
│   ├── courses/           # 코스 JSON
│   │   └── seongsu.json
│   └── fonts/             # GmarketSans
│
├── PRINCIPLES.md          # 개발 원칙 (1050줄)
└── .cursorrules           # AI 코딩 규칙
```

---

## 🚀 시작하기

### 필요 사항

- Flutter 3.x 이상
- Dart 3.x 이상
- Chrome (웹 테스트용)

### 설치 및 실행
```bash
# 1. 저장소 클론
git clone https://github.com/yun-jusik/jip01.git
cd jip01

# 2. 패키지 설치
flutter pub get

# 3. 웹에서 실행
flutter run -d chrome
```

---

## 📊 성공 지표

### MVP 목표

- 첫 사용: 15초 내 가치 이해 >80%
- 재듣기율: >70%
- NPS: >8/10
- HOC 공유 의향: >60%

### 측정 방법

- 10명 테스트
- 정성/정량 피드백
- 재듣기 횟수 추적

---

## 🎯 핵심 기능

### 1. 자동 감지
```
GPS 위치 → 동네 인식 → YouTube 영상 자동 재생
```

### 2. 전문가 안내
```
"지금 왼쪽 보세요..."
"이 건물이 중요한 이유는..."
"체크할 3가지: ..."
```

### 3. 판단 기준 제공
```
✓ 지하철역 7분 (기준: 10분 이내)
✓ 대형마트 있음 (기준: 15분 이내)
? 초등학교 재개발 여부 확인 필요
```

---

## ❌ 하지 않는 것

이 프로젝트는 의도적으로 다음을 하지 않습니다:

- ❌ AI 챗봇 (판단 요구)
- ❌ AR 기능 (복잡도 증가)
- ❌ 게임화/퀴즈 (주의 분산)
- ❌ 소셜 로그인 (진입 장벽)
- ❌ 다크 모드 (MVP 불필요)

**이유**: 복잡도 최소화 → 성공 확률 최대화

---

## 📚 문서

- [PRINCIPLES.md](PRINCIPLES.md) - 개발 원칙 및 철학 (1050줄)
- [.cursorrules](.cursorrules) - AI 코딩 규칙

---

## 🤝 기여

현재 MVP 개발 중으로 외부 기여는 받지 않습니다.

---

## 📝 라이선스

Private Repository - All Rights Reserved

---

## 👨‍💻 개발자

- **윤주식 (Yun Jusik)**
- 임장연구소 운영
- 789회 이상 임장 경험 (2018.05.25 ~ 현재)
- YouTube, Instagram 등 운영

---

## 📞 문의

- Email: mainfood7@gmail.com
- GitHub: [@yun-jusik](https://github.com/yun-jusik)

---

## 🎉 버전 히스토리

### v0.1.0 (2025-12-26)

- ✅ 프로젝트 초기 설정
- ✅ 디자인 시스템 완성
- ✅ 홈 화면 구현
- ✅ 웹 테스트 성공
- ✅ PRINCIPLES.md 작성

---

**"판단의 외로움"을 해소하는 가장 간단한 방법**

Made with ❤️ by 임장연구소