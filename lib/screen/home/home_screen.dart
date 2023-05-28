import 'package:flutter/material.dart';
import 'package:stock_store/widgets/custom_icon_button.dart';

import '../../constants/constants.dart';
import '../../data/data.dart';
import '../../widgets/product_card.dart';
import '../details/details_screen.dart';

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
    // "Energy",
    // "Consumer",
    // "Transportation",
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
            color:
                _selectedIndex == index ? Colors.grey[800] : Colors.grey[400],
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
                const Text(
                  'Stock Market',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppFontSize.fontSizeTitle,
                    fontWeight: AppFontWeight.fontWeightBold,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text('Welcome to the Stock Market App',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: AppFontSize.fontSizeBody,
                      fontWeight: AppFontWeight.fontWeightNormal,
                      fontFamily: 'Poppins',
                    )),
                const SizedBox(
                  height: 16.0,
                ),
                const BarApp(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                _buildProductListView(),
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
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DetailsScreen(
                              product: productData[index],
                            ))));
              },
              child: ProductCard(
                product: productData[index],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
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
