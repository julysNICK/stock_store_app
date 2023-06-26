import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock_store/screen/chat_supplier/chat_supplier_screen.dart';
import 'package:stock_store/screen/details_supplier/widgets/list_products/list_products.dart';

import '../../constants/constants.dart';
import '../home/bloc/home_bloc_bloc.dart';
import '../moreSupplier/bloc/supplier_bloc.dart';
import 'bloc/detail_supplier_bloc.dart';

class detailSupllier extends StatefulWidget {
  int id;
  detailSupllier({
    super.key,
    required this.id,
  });

  @override
  State<detailSupllier> createState() => _detailSupllierState();
}

class _detailSupllierState extends State<detailSupllier> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DetailSuppBloc>(context).add(DetailSupplierLoad(
      id: widget.id.toString(),
    ));
    BlocProvider.of<HomeBlocBloc>(context).add(HomeBlocGetProductBySupplierId(
      id: widget.id.toString(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double weigthContactsLinksResponsive =
        MediaQuery.of(context).size.width / 2;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => chat_supplier(
                id: widget.id.toString(),
              ),
            ),
          );
        },
        child: const Icon(Icons.support_agent),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    BlocBuilder<DetailSuppBloc, DetailSupplierState>(
                      builder: (context, state) {
                        return Container(
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
                        );
                      },
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
                BlocBuilder<DetailSuppBloc, DetailSupplierState>(
                  builder: (context, state) {
                    return Text(
                      state.supplier?.name ?? "Carregando...",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  "Contacts links",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(height: 10),
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: constraints.maxWidth / 2 - 55,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.grey,
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: constraints.maxWidth / 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const FaIcon(
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
                          width: constraints.maxWidth / 2 - 55,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.greenAccent,
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Whatsapp",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: constraints.maxWidth / 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const FaIcon(
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
                          width: constraints.maxWidth / 2 - 55,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.purpleAccent,
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Instagram",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: constraints.maxWidth / 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
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
                BlocBuilder<SupplierBloc, SupplierState>(
                  builder: (context, state) {
                    return Text(
                      state.suppliers[0].address,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: AppFontSize.fontSizeSubTitle,
                        fontWeight: FontWeight.w600,
                        fontFamily: appFontFamily.fontFamilyDefault,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Produtos do fornecedor",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: AppFontSize.fontSizeSubTitle,
                            fontWeight: AppFontWeight.fontWeightBold,
                            fontFamily: appFontFamily.fontFamilyDefault,
                          )),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<HomeBlocBloc, HomeBlocState>(
                  builder: (context, state) {
                    return list_products(
                      products: state.products,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
