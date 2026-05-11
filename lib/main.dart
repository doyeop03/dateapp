import 'package:flutter/material.dart';

import 'core/theme/app_text_styles.dart';
import 'core/theme/app_theme.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/friend/friend_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/my/my_screen.dart';
import 'screens/notice/notice_screen.dart';
import 'core/theme/app_colors.dart';

/// 앱 실행 시작점
///
/// Flutter 앱은 main() 함수에서 시작함.
/// runApp() 안에 최상위 위젯을 넣어주면 그 위젯부터 화면이 그려짐.
void main() {
  runApp(const SigApp());
}

/// 앱 전체를 감싸는 최상위 위젯
///
/// MaterialApp은 Flutter에서 앱의 기본 설정을 담당함.
/// 예:
/// - 앱 이름
/// - 테마
/// - 첫 화면
/// - 디버그 배너 표시 여부
class SigApp extends StatelessWidget {
  const SigApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 앱 이름
      /// 실제 화면에 무조건 보이는 건 아니지만, 앱 설정값으로 사용됨.
      title: 'SIG',

      /// 오른쪽 위 DEBUG 표시 제거
      debugShowCheckedModeBanner: false,

      /// 앱 전체 테마 설정
      theme: AppTheme.light(),

      /// 앱이 처음 실행될 때 보여줄 화면
      home: const MainNavigation(),
    );
  }
}

/// 하단 네비게이션 바를 가진 메인 화면
///
/// 이 화면에서 하단 탭을 누르면
/// 홈 / 친구 / 채팅 / 마이페이지로 화면이 바뀜.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

/// StatefulWidget의 실제 상태를 관리하는 클래스
///
/// 탭 번호가 바뀌면 화면도 바뀌어야 하므로
/// 현재 선택된 탭 번호를 상태값으로 가지고 있어야 함.
class _MainNavigationState extends State<MainNavigation> {
  /// 현재 선택된 하단 탭 번호
  ///
  /// 0 = 홈
  /// 1 = 친구 등록 / 매칭
  /// 2 = 채팅
  /// 3 = 마이페이지
  int _selectedIndex = 0;

  /// 하단 탭 번호에 따라 보여줄 화면 목록
  ///
  /// _selectedIndex가 0이면 HomeScreen,
  /// _selectedIndex가 1이면 FriendPage가 보임.
  final List<Widget> _pages = const [
    HomeScreen(),
    FriendPage(),
    ChatPage(),
    MyPage(),
  ];

  /// 하단 탭을 눌렀을 때 실행되는 함수
  ///
  /// setState()를 호출해야 Flutter가 화면을 다시 그림.
  /// 즉, 탭 번호만 바꾸는 게 아니라 화면까지 갱신됨.
  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// 앱바 오른쪽 알림 아이콘을 눌렀을 때 실행되는 함수
  ///
  /// Navigator.push()는 새 화면으로 이동할 때 사용함.
  /// 여기서는 NoticePage를 새 화면으로 띄움.
  void _openNoticePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const NoticePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 상단 앱바
      appBar: _buildAppBar(),

      /// 현재 선택된 탭 번호에 맞는 화면 표시
      body: _pages[_selectedIndex],

      /// 하단 네비게이션 바
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// 앱바를 따로 함수로 분리
  ///
  /// build() 안에 앱바 코드를 전부 넣으면 길어지기 때문에
  /// 따로 함수로 빼면 코드가 읽기 쉬워짐.
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'SIG',
        style: AppTextStyles.appTitle,
      ),
      actions: [
        IconButton(
          /// 알림 페이지로 이동
          onPressed: _openNoticePage,

          /// 알림 아이콘
          icon: const Icon(
            Icons.notifications_none,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  /// 하단 네비게이션 바를 따로 함수로 분리
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      /// 탭이 4개 이상일 때는 fixed를 쓰는 게 안정적임
      type: BottomNavigationBarType.fixed,

      /// 현재 선택된 탭 번호
      currentIndex: _selectedIndex,

      /// 선택된 아이콘 색상
      selectedItemColor: AppColors.primary,

      /// 선택되지 않은 아이콘 색상
      unselectedItemColor: Colors.grey,

      /// 아이콘 아래 라벨 숨김
      showSelectedLabels: false,
      showUnselectedLabels: false,

      /// 탭을 눌렀을 때 실행
      onTap: _changeTab,

      /// 하단 탭 아이템들
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}