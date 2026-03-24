import 'package:flutter/material.dart';

// ✅ 1. 앱의 시작점 (Java의 main 메소드와 동일)
void main() {
  runApp(const MyTestApp());
}

// ✅ 2. 앱의 최상위 위젯 (상태가 없는 정적인 화면)
class MyTestApp extends StatelessWidget {
  const MyTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iOS Build Test',
      theme: ThemeData(
        // 아이폰 스타일(Cupertino)과 비슷한 테마 세팅
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CounterPage(), // 실제 화면 연결
    );
  }
}

// ✅ 3. 카운터 화면 위젯 (상태가 변하는 화면)
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// ✅ 4. 카운터 화면의 '상태'를 관리하는 클래스
class _CounterPageState extends State<CounterPage> {
  // 🔢 카운트 변수 (Java의 int intValue = 0; 와 동일)
  int _counter = 0;

  // ➕ 버튼을 눌렀을 때 호출될 함수
  void _incrementCounter() {
    setState(() {
      // 👈 setState()를 호출해야 화면이 다시 그려집니다.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold는 화면의 기본 구조(앱바, 바디, 버튼)를 잡는 위젯입니다.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('아이폰 빌드 테스트 앱'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '버튼을 누른 횟수:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_counter', // 👈 변수 값을 화면에 표시
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      // ➕ 우측 하단의 플로팅 액션 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 👈 클릭 시 함수 호출
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}