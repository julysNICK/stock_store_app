import 'package:flutter/material.dart';
import 'package:stock_store/widgets/custom_icon_button.dart';

import '../../constants/constants.dart';
import '../../data/data.dart';
import '../../widgets/product_card.dart';

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
        child: Text(
          _tags[index],
          style: TextStyle(
            color: _selectedIndex == index ? Colors.grey[400] : Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
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
                const BarApp(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _tags
                      .asMap()
                      .entries
                      .map(
                        (MapEntry map) => _buildTags(
                          map.key,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductListView() {
    return ListView.builder(
      itemCount: productData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ProductCard(
          product: productData[index],
        );
      },
    );
  }
}

class BarApp extends StatelessWidget {
  const BarApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
