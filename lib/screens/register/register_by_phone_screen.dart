import 'package:flutter/material.dart';

class RegisterByPhoneScreen extends StatefulWidget {
  const RegisterByPhoneScreen({super.key});

  @override
  State<RegisterByPhoneScreen> createState() => _RegisterByPhoneScreenState();
}

class _RegisterByPhoneScreenState extends State<RegisterByPhoneScreen> {
  // 임시 연락처 데이터 리스트
  final List<Map<String, String>> _contacts = [
    {'name': '김하나', 'phone': '010-1234-4567'},
    {'name': '김하나', 'phone': '010-1234-4567'},
    {'name': '김하나', 'phone': '010-1234-4567'},
    {'name': '김두울', 'phone': '010-5555-3333'},
    {'name': '김두울', 'phone': '010-5555-3333'},
    {'name': '김두울', 'phone': '010-5555-3333'},
    {'name': '김두울', 'phone': '010-5555-3333'},
    {'name': '김두울', 'phone': '010-5555-3333'},
  ];

  // 선택된 연락처 인덱스를 저장하는 세트
  final Set<int> _selectedIndices = {};
  bool _isAllSelected = false;

  // 전체 선택 토글 함수
  void _toggleSelectAll() {
    setState(() {
      if (_isAllSelected) {
        _selectedIndices.clear();
      } else {
        _selectedIndices.addAll(Iterable<int>.generate(_contacts.length));
      }
      _isAllSelected = !_isAllSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // 연한 회색 배경
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF333333), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '전화번호부에서 불러오기',
          style: TextStyle(color: Color(0xFF1F2937), fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 1. 상단 정보 및 검색바 영역
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_contacts.length}명의 연락처',
                  style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                ),
                const SizedBox(height: 15),
                // 검색바
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Color(0xFF9CA3AF), size: 20),
                      hintText: '이름 또는 전화번호 검색',
                      hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // 전체 선택 체크박스
                GestureDetector(
                  onTap: _toggleSelectAll,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '전체선택',
                        style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        _isAllSelected ? Icons.check_box : Icons.check_box_outline_blank,
                        color: _isAllSelected ? const Color(0xFFD45D65) : const Color(0xFFD1D5DB),
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. 연락처 리스트 영역
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(8),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: _contacts.length,
                  separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFF3F4F6)),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndices.contains(index);
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFE5E7EB),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(
                        _contacts[index]['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        _contacts[index]['phone']!,
                        style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                      ),
                      trailing: Icon(
                        isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                        color: isSelected ? const Color(0xFFD45D65) : const Color(0xFFE5E7EB),
                        size: 26,
                      ),
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedIndices.remove(index);
                            _isAllSelected = false;
                          } else {
                            _selectedIndices.add(index);
                            if (_selectedIndices.length == _contacts.length) _isAllSelected = true;
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ),

          // 3. 하단 선택완료 버튼
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _selectedIndices.isEmpty
                    ? null
                    : () {
                        // TODO: 선택된 연락처 처리 로직
                        // ignore: avoid_print
                        print('선택된 인덱스: $_selectedIndices');
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD45D65),
                  disabledBackgroundColor: const Color(0xFFE5E7EB),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 0,
                ),
                child: const Text(
                  '선택완료',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

