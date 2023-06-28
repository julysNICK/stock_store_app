import 'package:flutter/material.dart';

import '../../widgets/bottomBar.dart';
import '../home/home_screen.dart';
import '../moreSupplier/more_supplier_screen.dart';
import '../profile/profile_screen.dart';

class NavBarBottom extends StatefulWidget {
  const NavBarBottom({super.key});

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  final List _screens = [
    const Home(),
    const moreSupplierScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: bottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          print("cliquei");
          setState(() {
            currentIndex = index;
            _screens[index];
          });
        },
      ),
    );
  }
}
