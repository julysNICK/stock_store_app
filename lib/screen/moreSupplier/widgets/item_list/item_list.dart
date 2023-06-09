import 'package:flutter/material.dart';
import 'package:stock_store/models/supplier.dart';

import '../../../details_supplier/detail_supplier_screen.dart';

class item_list extends StatelessWidget {
  Supplier supplier;
  item_list({
    super.key,
    required this.supplier,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => detailSupllier(id: supplier.id),
            ),
          );
        },
        title: Text(supplier.name),
        subtitle: Text("${supplier.id}"),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
