import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

ValueNotifier<int> navigationNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: navigationNotifier,
      builder: (context, int newValue, _) {
        return BottomNavigationBar(
          onTap: (index) {
            navigationNotifier.value = index;
          },
          currentIndex: newValue,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections),
              label: "New&Hot",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions),
              label: "Fast laugh",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: "Downloads",
            ),
          ],
        );
      },
    );
  }
}
