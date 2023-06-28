import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_store/screen/moreSupplier/widgets/item_list/item_list.dart';

import 'bloc/supplier_bloc.dart';

class moreSupplierScreen extends StatefulWidget {
  const moreSupplierScreen({super.key});

  @override
  State<moreSupplierScreen> createState() => _moreSupplierScreenState();
}

class _moreSupplierScreenState extends State<moreSupplierScreen> {
  late final SupplierBloc _providerSupplier =
      BlocProvider.of<SupplierBloc>(context);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_providerSupplier.isClosed) {
      return;
    }

    _providerSupplier.add(SupplierGetAllSuppliers());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _providerSupplier.close();
  }

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
                BlocBuilder<SupplierBloc, SupplierState>(
                  builder: (context, state) {
                    return Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.suppliers.length,
                        itemBuilder: (context, index) {
                          return item_list(
                            supplier: state.suppliers[index],
                          );
                        },
                      ),
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
