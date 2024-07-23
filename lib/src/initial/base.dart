import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          Container(color: Colors.white.withAlpha(100)),
          Container(color: Colors.grey.withAlpha(100)),
          Container(color: Colors.green.withAlpha(100)),
          Container(color: Colors.blue.withAlpha(100)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Legenda'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Agenda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Perfil')
        ],
      ),
    );
  }
}
