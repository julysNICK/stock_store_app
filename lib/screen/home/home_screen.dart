import 'package:flutter/material.dart';
import 'package:stock_store/widgets/custom_icon_button.dart';

import '../../constants/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _tags = [
    "All",
    "Technology",
    "Health",
    "Finance",
    "Energy",
    "Consumer",
    "Transportation",
  ];

  int _selectedIndex = 0;

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 15.0,
        ),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? AppColor.mainColorPrimary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              children: [
                Text(
                  'Stock Market',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  'Welcome to the Stock Market App',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            labelText: 'Search',
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: AppColor.mainColorSecondary,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    customIconButton(
                      backColor: AppColor.mainColorSecondary,
                      child: const Icon(
                        Icons.filter_list,
                        color: Colors.black,
                      ),
                      onTap: () {},
                      radius: const BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
