import 'package:flutter/material.dart';

// 앱 전체에서 공통으로 사용하는 색상값 import
import '../core/theme/app_colors.dart';

// 앱 전체에서 공통으로 사용하는 글자 스타일 import
import '../core/theme/app_text_styles.dart';

/// 앱 전체에서 재사용할 메인 버튼 위젯
///
/// 예를 들어:
/// - 등록하기
/// - 선택완료
/// - 저장하기
/// - 다음으로
///
/// 이런 버튼들이 같은 디자인을 사용할 때
/// 이 PrimaryButton 하나만 가져다 쓰면 됨.
class PrimaryButton extends StatelessWidget {
  /// 버튼 안에 표시될 글자
  ///
  /// 예:
  /// PrimaryButton(
  ///   text: '등록하기',
  ///   onPressed: () {},
  /// )
  final String text;

  /// 버튼을 눌렀을 때 실행할 함수
  ///
  /// VoidCallback은 쉽게 말해서
  /// "아무 값도 받지 않고, 아무 값도 반환하지 않는 함수"라는 뜻.
  ///
  /// 예:
  /// onPressed: () {
  ///   print('버튼 클릭');
  /// }
  final VoidCallback onPressed;

  /// PrimaryButton 생성자
  ///
  /// required가 붙어 있으므로
  /// text와 onPressed는 반드시 넣어줘야 함.
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    /// SizedBox로 버튼의 크기를 고정
    ///
    /// width: double.infinity
    /// → 부모가 허용하는 가로 너비를 전부 사용
    ///
    /// height: 55
    /// → 버튼 높이를 55로 고정
    return SizedBox(
      width: double.infinity,
      height: 55,

      /// 실제 버튼 위젯
      child: ElevatedButton(
        /// 버튼 클릭 시 실행할 함수
        ///
        /// PrimaryButton을 사용하는 쪽에서 넘겨준 onPressed가 실행됨.
        onPressed: onPressed,

        /// 버튼 디자인 설정
        style: ElevatedButton.styleFrom(
          /// 버튼 배경색
          /// app_colors.dart에 정의해둔 메인 색상 사용
          backgroundColor: AppColors.primary,

          /// 버튼 모서리를 둥글게 만드는 부분
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),

        /// 버튼 안에 들어가는 글자
        child: Text(
          text,

          /// app_text_styles.dart에 정의해둔 버튼 글자 스타일 사용
          style: AppTextStyles.buttonText,
        ),
      ),
    );
  }
}