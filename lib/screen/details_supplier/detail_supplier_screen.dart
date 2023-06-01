import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock_store/screen/chat_supplier/chat_supplier_screen.dart';

import '../../constants/constants.dart';

class detailSupllier extends StatefulWidget {
  const detailSupllier({super.key});

  @override
  State<detailSupllier> createState() => _detailSupllierState();
}

class _detailSupllierState extends State<detailSupllier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const chat_supplier(),
              ),
            );
          },
          child: const Icon(Icons.support_agent),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         Navigator.pop(context);
                    //       },
                    //       child: const Icon(Icons.arrow_back_ios),
                    //     ),
                    //     const Text('Supplier'),
                    //     const SizedBox(width: 30),
                    //   ],
                    // ),
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      child: Image.network(
                        "https://d2nytdlptrqhdi.cloudfront.net/wp-content/uploads/2017/11/Selos-Fornecedores-2018-01-Cor-e1511947901805.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    // Positioned(right: 10, top: 10, child: customLikeButton())
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nama Supplier',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Contacts links",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.envelope,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Whatsapp",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Instagram",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Informaçoes do fornecedor",
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
                  "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: AppFontSize.fontSizeSubTitle,
                    fontWeight: FontWeight.w600,
                    fontFamily: appFontFamily.fontFamilyDefault,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
