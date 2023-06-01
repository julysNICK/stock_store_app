import 'package:flutter/material.dart';
import 'package:stock_store/constants/constants.dart';

import 'cutom_buy_detail_screen.dart';

class SkeletonBottomSheetDelete extends StatefulWidget {
  String title;
  Color colorButton;
  SkeletonBottomSheetDelete(
      {super.key, required this.title, required this.colorButton});

  @override
  State<SkeletonBottomSheetDelete> createState() =>
      _SkeletonBottomSheetDeleteState();
}

class _SkeletonBottomSheetDeleteState extends State<SkeletonBottomSheetDelete> {
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
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: Text(
                    "Tem certeza que deseja excluir este produto?",
                    style: TextStyle(
                      fontSize: AppFontSize.fontSizeTitle,
                      fontWeight: AppFontWeight.fontWeightBold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: customBuyDetailScreen(
                    onTap: () {},
                    title: widget.title,
                    color: Colors.white,
                    colorButton: widget.colorButton,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: customBuyDetailScreen(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    title: "Cancelar",
                    color: Colors.white,
                    colorButton: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
