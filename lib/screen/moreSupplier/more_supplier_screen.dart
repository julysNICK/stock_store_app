import 'package:flutter/material.dart';

import '../../widgets/bottomBar.dart';
import '../details_supplier/detail_supplier_screen.dart';

class moreSupplierScreen extends StatefulWidget {
  const moreSupplierScreen({super.key});

  @override
  State<moreSupplierScreen> createState() => _moreSupplierScreenState();
}

class _moreSupplierScreenState extends State<moreSupplierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          // height: double.maxFinite,
          // width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const detailSupllier(),
                              ),
                            );
                          },
                          title: Text('Supplier $index'),
                          subtitle: Text('Supplier $index'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }
}
