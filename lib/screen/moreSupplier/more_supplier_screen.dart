import 'package:flutter/material.dart';
import 'package:stock_store/screen/moreSupplier/widgets/item_list/item_list.dart';

import '../../widgets/bottomBar.dart';

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
                      return const item_list();
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
