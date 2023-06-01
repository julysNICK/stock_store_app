import 'package:flutter/material.dart';
import 'package:stock_store/constants/constants.dart';
import 'package:stock_store/widgets/dropdown_screen.dart';

import 'cutom_buy_detail_screen.dart';

class SkeletonBottomSheet extends StatefulWidget {
  String title;
  Color colorButton;
  SkeletonBottomSheet(
      {super.key, required this.title, required this.colorButton});

  @override
  State<SkeletonBottomSheet> createState() => _SkeletonBottomSheetState();
}

class _SkeletonBottomSheetState extends State<SkeletonBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (ctx, scrollCOntroller) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 1000,
            child: Column(
              children: [
                const Text(
                  "Informações de compra",
                  style: TextStyle(
                    fontSize: AppFontSize.fontSizeTitle,
                    fontWeight: AppFontWeight.fontWeightBold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Valor da unidade:",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                      Text(
                        "R\$ 10,00",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Quantidade:",
                            style: TextStyle(
                              fontSize: AppFontSize.fontSizeSubTitle,
                              fontWeight: AppFontWeight.fontWeightBold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownQuantity(),
                        ],
                      ),
                      const Text(
                        "R\$ 10,00",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Frete:",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                      Text(
                        "R\$ 10,00",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                      Text(
                        "R\$ 10,00",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customBuyDetailScreen(
                  onTap: () {},
                  title: widget.title,
                  color: Colors.white,
                  colorButton: widget.colorButton,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
