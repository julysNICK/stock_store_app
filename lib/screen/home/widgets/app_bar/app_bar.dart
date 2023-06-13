import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/constants.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../bloc/home_bloc_bloc.dart';

class BarApp extends StatefulWidget {
  const BarApp({
    super.key,
  });

  @override
  State<BarApp> createState() => _BarAppState();
}

class _BarAppState extends State<BarApp> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                BlocProvider.of<HomeBlocBloc>(context).add(
                  HomeBlocSearch(
                    query: value,
                  ),
                );
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                labelText: 'Search',
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: AppColor.mainColorSecondary,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        customIconButton(
          backColor: AppColor.mainColorSecondary,
          child: const Icon(
            Icons.filter_list,
            color: Colors.black,
          ),
          onTap: () {},
          radius: const BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        )
      ],
    );
  }
}
