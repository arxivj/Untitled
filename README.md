# 프로젝트 구조

기능별로 데이터를 처리하는 로직(data), 비즈니스 로직(domain), 프레젠테이션 로직(presentation)을 분리함

## 폴더 구조

```bash
lib/
├── core/                 # 공통적으로 사용되는 유틸리티, 예외 처리, 유스케이스 등
│   ├── exceptions/       # 예외 처리 관련 파일
│   ├── usecases/         # 유스케이스 (비즈니스 로직)
│   └── utils/            # 공통 유틸리티 파일
│
├── features/             # 각 기능별 모듈 (기능 중심 구조)
│   ├── feature_a/        # 기능 A 관련 폴더
│   │   ├── data/         # 데이터 소스, 모델, 리포지토리
│   │   ├── domain/       # 엔티티, 유스케이스 등 비즈니스 로직
│   │   │   ├── entities/     # 비즈니스 객체를 정의하는 엔티티
│   │   │   ├── usecases/     # 유스케이스 정의
│   │   │   └── repositories/ # 도메인 레이어의 리포지토리 인터페이스
│   │   ├── presentation/ # UI와 관련된 페이지, 뷰모델
│   │   │   ├── pages/        # 페이지와 관련된 파일들
│   │   │   └── viewmodels/   # 뷰모델 파일들
│   │   └── widgets/      # 기능 A에 대한 위젯
│   ├── feature_b/        # 기능 B 관련 폴더
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   └── widgets/
│   └── ...               # 다른 기능들도 동일한 구조
│
├── providers/            # 상태 관리 관련 프로바이더
│   └── theme_provider.dart
│
├── themes/               # 앱 전체의 테마 및 스타일 관리
│   ├── color/            # 색상 관련 설정 (팔레트)
│   ├── mode/             # 다크/라이트 모드 관련 설정
│   ├── app_theme.dart    # 테마 설정 파일
│   ├── app_theme_styles.dart
│   ├── app_theme_typography.dart
│   └── extensions.dart
│
├── widgets/              # 공통적으로 사용되는 재사용 가능한 위젯들
│   ├── shared/           # 여러 페이지에서 공통적으로 사용되는 위젯
│   └── specific/         # 특정 페이지에 종속적인 위젯
│
└── main.dart             # 앱의 진입점
