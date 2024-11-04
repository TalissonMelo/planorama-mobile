import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/home/home.dart';
import 'package:liberbox_mobile/src/legend/view/legend.dart';
import 'package:liberbox_mobile/src/notifications/view/notifications.dart';
import 'package:liberbox_mobile/src/profile/view/profile.dart';
import 'package:liberbox_mobile/src/schedule/view/schedule.dart';

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
        children: const [
          Home(),
          Legend(),
          Schedule(),
          Notifications(),
          Profile()
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
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.description),
            label: 'legenda'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.event),
            label: 'agenda'.tr,
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                if (5 > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            label: 'notificacao'.tr,
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Perfil')
        ],
      ),
    );
  }
}
