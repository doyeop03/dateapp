import 'package:flutter/material.dart';

// 앱 전체에서 공통으로 사용하는 글자 스타일 import
// 예: AppTextStyles.sectionTitle
import '../core/theme/app_text_styles.dart';

/// 섹션 제목을 표시하는 공통 위젯
///
/// 예를 들어:
/// - 새로운 알림
/// - 새로운 친구
/// - 매칭성공
/// - 대기중 명단
///
/// 이런 제목들이 여러 화면에서 같은 디자인으로 반복될 때
/// SectionTitle을 가져다 쓰면 됨.
class SectionTitle extends StatelessWidget {
  /// 화면에 표시할 제목 글자
  ///
  /// 예:
  /// SectionTitle('채팅')
  /// SectionTitle('대기중 명단')
  final String text;

  /// SectionTitle 생성자
  ///
  /// this.text는 위치 기반 인자라서 이렇게 사용함:
  ///
  /// const SectionTitle('새로운 알림')
  ///
  /// required this.text처럼 이름을 붙여서 쓰는 방식보다
  /// 제목 위젯처럼 간단한 경우에는 이 방식도 많이 씀.
  const SectionTitle(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// Text 위젯으로 제목을 화면에 표시
    ///
    /// style에는 app_text_styles.dart에 정의한
    /// 공통 섹션 제목 스타일을 적용함.
    return Text(
      text,
      style: AppTextStyles.sectionTitle,
    );
  }
}