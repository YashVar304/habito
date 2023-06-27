import 'package:flutter/material.dart';
import 'package:habito/pages/habit.dart';
import 'package:habito/pages/homepage.dart';
import 'package:habito/pages/profile.dart';
import 'package:habito/pages/progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NavigationScreen(current_index: 0),
    );
  }
}

// ignore: must_be_immutable
class NavigationScreen extends StatefulWidget {
  NavigationScreen({super.key, required this.current_index});
  int current_index;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

List<Widget> screens = [
  HomePage(),
  ProgressPage(),
  Habitspage(),
  ProfilePage(),
];

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: widget.current_index,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: widget.current_index,
          onTap: (index) {
            setState(() {
              widget.current_index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Progress'),
            BottomNavigationBarItem(icon: Icon(Icons.timeline), label: 'Habit'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ));
  }
}
