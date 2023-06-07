import 'package:flutter/material.dart';
import 'package:stock_store/screen/home/home_screen.dart';

import '../screen/moreSupplier/more_supplier_screen.dart';

class bottomBar extends StatelessWidget {
  const bottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
            child: const Icon(
              Icons.home,
              color: Colors.grey,
            ),
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
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const moreSupplierScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.store,
              color: Colors.grey,
            ),
          ),
          label: 'Suppliers',
        ),
        const BottomNavigationBarItem(
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
