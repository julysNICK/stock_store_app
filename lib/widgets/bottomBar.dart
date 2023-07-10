import 'package:flutter/material.dart';

class bottomBar extends StatelessWidget {
  void Function(int)? onTap;
  int currentIndex = 0;
  bottomBar({super.key, this.onTap, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: onTap,
      currentIndex: currentIndex,
      elevation: 0.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          label: 'Home',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.favorite,
        //     color: Colors.grey,
        //   ),
        //   label: 'Favorite',
        // ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.store,
            color: Colors.grey,
          ),
          label: 'Suppliers',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
