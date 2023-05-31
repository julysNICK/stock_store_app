import 'package:flutter/material.dart';
import 'package:stock_store/screen/details_supplier/detail_supplier_screen.dart';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const Text('Supplier'),
                    const SizedBox(width: 30),
                  ],
                ),
                ListView.builder(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
