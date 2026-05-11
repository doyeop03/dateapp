import 'package:flutter/material.dart';

import 'register_by_phone_screen.dart';

class RegisterFriendScreen extends StatelessWidget {
  const RegisterFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 앱바 설정 (뒤로가기 아이콘과 제목)
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF333333)), // 뒤로가기 아이콘 색상
          onPressed: () {
            // 현재 화면 닫기 (뒤로가기)
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '새로운 사람 등록',
          style: TextStyle(
            color: Color(0xFF1F2937), // 텍스트 색상
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false, // 제목 왼쪽 정렬
        backgroundColor: Colors.white, // 앱바 배경색
        elevation: 0, // 앱바 그림자 제거
      ),
      body: Container(
        color: Colors.white, // 전체 배경색
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0), // 전체 여백
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
            children: [
              // 2. 상단 안내 텍스트
              const Text(
                '어디서 불러올까요?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6B7280), // 연한 회색
                ),
              ),
              const SizedBox(height: 5), // 위아래 간격
              const Text(
                '아래 중 하나를 선택하면 친구목록에서\n바로 고를 수 있어요.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9CA3AF), // 더 연한 회색
                  height: 1.4, // 줄 간격
                ),
              ),
              const SizedBox(height: 30), // 위아래 간격

              // 3. 불러오기 버튼들 (카드 UI)
              _buildImportCard(
                context,
                iconPath: 'assets/images/kakao_icon.png', // 카카오톡 아이콘 경로
                title: '카카오톡에서 불러오기',
                subtitle: '카카오톡 친구 목록에서 선택',
                onTap: () {
                  // TODO: 카카오톡 로그인 및 친구 목록 불러오기 로직 구현
                  // ignore: avoid_print
                  print('카카오톡 클릭');
                },
                useCustomIcon: true,
              ),
              const SizedBox(height: 15),

              _buildImportCard(
                context,
                iconPath: 'assets/images/instagram_icon.png', // 인스타그램 아이콘 경로
                title: '인스타그램에서 불러오기',
                subtitle: '인스타그램 팔로워에서 선택',
                onTap: () {
                  // TODO: 인스타그램 로그인 및 팔로워 목록 불러오기 로직 구현
                  // ignore: avoid_print
                  print('인스타그램 클릭');
                },
                useCustomIcon: true,
              ),
              const SizedBox(height: 15),

              _buildImportCard(
                context,
                iconData: Icons.call, // 전화번호부 아이콘
                title: '전화번호부에서 불러오기',
                subtitle: '카카오톡 친구 목록에서 선택',
                onTap: () {
                  // 전화번호부 등록 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterByPhoneScreen()),
                  );
                },
                useCustomIcon: false,
              ),
              const SizedBox(height: 25),

              // 4. 하단 안심 메시지 (핑크색 카드)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F1), // 연한 핑크색 배경
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.security, // 방패 아이콘
                      color: Color(0xFFE05C66), // 핑크색 아이콘
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '안심하세요!',
                            style: TextStyle(
                              color: Color(0xFFE05C66), // 핑크색 텍스트
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '등록한 사람은 상대방이 서로 등록해야\n이름이 공개돼요.',
                            style: TextStyle(
                              color: Color(0xFFFF9E9E), // 더 연한 핑크색 텍스트
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 5. 불러오기 카드 빌더 (공통 UI)
  Widget _buildImportCard(
    BuildContext context, {
    String? iconPath,
    IconData? iconData,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required bool useCustomIcon,
  }) {
    return InkWell(
      onTap: onTap, // 클릭 시 실행할 함수
      borderRadius: BorderRadius.circular(15), // 클릭 효과 범위
      child: Ink(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15), // 둥근 모서리
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13), // 아주 연한 그림자
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3), // 그림자 위치
            ),
          ],
        ),
        child: Row(
          children: [
            // 아이콘 부분
            useCustomIcon
                ? Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        iconPath!,
                        width: 30, // 디자인에 맞게 크기 조절
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3F4F6), // 전화번호부 아이콘 연한 회색 배경
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.call,
                      color: Color(0xFF6B7280), // 전화번호부 아이콘 색상
                      size: 22,
                    ),
                  ),
            const SizedBox(width: 20),
            // 텍스트 부분
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600, // 약간 굵게
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF9CA3AF), // 연한 회색
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

