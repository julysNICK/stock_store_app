import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stock_store/constants/constants.dart';
import 'package:stock_store/widgets/dropdown_screen.dart';
import 'package:stock_store/widgets/popup_error.dart';
import 'package:stock_store/widgets/popup_sucess.dart';
import 'cutom_buy_detail_screen.dart';

class SkeletonBottomSheet extends StatefulWidget {
  String title;
  Color colorButton;
  String id;
  String price;
  SkeletonBottomSheet({
    super.key,
    required this.title,
    required this.colorButton,
    required this.id,
    required this.price,
  });

  @override
  State<SkeletonBottomSheet> createState() => _SkeletonBottomSheetState();
}

class _SkeletonBottomSheetState extends State<SkeletonBottomSheet> {
  String dropdownValue = '1';
  BuildContext? dialogContext;
  Future<void> buyProduct() async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';

      final response = await http.patch(
        Uri.parse('$baseUrl/buy/products/2'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "quantity": 10,
          "store_id": 2,
        }),
      );
      dialogContext = context;
      showDialog(
        context: dialogContext!,
        builder: (BuildContext context) =>
            const Popup_Success(errorSuccess: "Compra realizada"),
      );
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) => Popup_Error(errorMessage: e.toString()),
      );
    }
  }

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
                    children: [
                      const Text(
                        "Valor da unidade:",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "R\$ ${widget.price},00",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
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
                        children: [
                          const Text(
                            "Quantidade:",
                            style: TextStyle(
                              fontSize: AppFontSize.fontSizeSubTitle,
                              fontWeight: AppFontWeight.fontWeightBold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          DropdownQuantity(
                            dropdownValue: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        "R\$ ${int.parse(widget.price) * int.parse(dropdownValue)},00",
                        style: const TextStyle(
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
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Frete:",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                      Text(
                        "R\$ 15,00",
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
                      const Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: AppFontSize.fontSizeSubTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                        ),
                      ),
                      Text(
                        'R\$ ${(int.parse(widget.price) * int.parse(dropdownValue)) + 15},00',
                        style: const TextStyle(
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
                  onTap: () {
                    buyProduct();
                  },
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
