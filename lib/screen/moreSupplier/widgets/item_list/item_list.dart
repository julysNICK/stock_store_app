import 'package:flutter/material.dart';

import '../../../details_supplier/detail_supplier_screen.dart';

class item_list extends StatelessWidget {
  const item_list({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Supplier'),
        subtitle: const Text('Supplier'),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
