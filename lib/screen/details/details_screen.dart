import 'package:flutter/material.dart';
import 'package:stock_store/constants/constants.dart';
import 'package:stock_store/data/data.dart';
import 'package:stock_store/widgets/custom_icon_button.dart';

import '../../widgets/custom_like_button.dart';

class DetailsScreen extends StatefulWidget {
  final ProductDataModel product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<String> _sizes = [
    "45",
    "46",
    "47",
    "48",
    "49",
  ];

  int _selectedIndex = 0;

  Widget _buildSizeTags(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? AppColor.mainColorPrimary
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        child: Center(
          child: Text(
            _sizes[index],
            style: TextStyle(
              color: _selectedIndex != index ? Colors.grey[400] : Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: widget.product.color,
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      child: Hero(
                          tag: widget.product.id,
                          child: Image.network(widget.product.image)),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Positioned(right: 10, top: 10, child: customLikeButton())
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product.name,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: AppFontSize.fontSizeTitle * 1.5,
                    fontWeight: AppFontWeight.fontWeightBold,
                    fontFamily: appFontFamily.fontFamilyDefault,
                  ),
                ),
                Text(
                  widget.product.tagLine,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: AppFontSize.fontSizeSubTitle,
                    fontWeight: FontWeight.w600,
                    fontFamily: appFontFamily.fontFamilyDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Select Size",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: AppFontSize.fontSizeSubTitle,
                    fontWeight: AppFontWeight.fontWeightBold,
                    fontFamily: appFontFamily.fontFamilyDefault,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _sizes.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          _buildSizeTags(index),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: AppFontSize.fontSizeSubTitle,
                    fontWeight: AppFontWeight.fontWeightBold,
                    fontFamily: appFontFamily.fontFamilyDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: AppFontSize.fontSizeSubTitle,
                    fontWeight: FontWeight.w600,
                    fontFamily: appFontFamily.fontFamilyDefault,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Reviews",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: AppFontSize.fontSizeSubTitle,
                    fontWeight: AppFontWeight.fontWeightBold,
                    fontFamily: appFontFamily.fontFamilyDefault,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                "https://yt3.googleusercontent.com/FDTAs2WBocPgKIGpfnpK41E0VIO8Z1IJ3s_xHMVq7IZOuRG_besPXBnM-U0oVpUcgx_2BZvC=s900-c-k-c0x00ffffff-no-rj",
                              ),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  "https://yt3.googleusercontent.com/FDTAs2WBocPgKIGpfnpK41E0VIO8Z1IJ3s_xHMVq7IZOuRG_besPXBnM-U0oVpUcgx_2BZvC=s900-c-k-c0x00ffffff-no-rj",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  "https://yt3.googleusercontent.com/FDTAs2WBocPgKIGpfnpK41E0VIO8Z1IJ3s_xHMVq7IZOuRG_besPXBnM-U0oVpUcgx_2BZvC=s900-c-k-c0x00ffffff-no-rj",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  "https://yt3.googleusercontent.com/FDTAs2WBocPgKIGpfnpK41E0VIO8Z1IJ3s_xHMVq7IZOuRG_besPXBnM-U0oVpUcgx_2BZvC=s900-c-k-c0x00ffffff-no-rj",
                                ),
                                child: Text(
                                  "+2",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    customIconButton(
                      backColor: AppColor.mainColorPrimary,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onTap: () {},
                      radius: BorderRadius.circular(10),
                    ),
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
