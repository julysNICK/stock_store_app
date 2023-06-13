import 'package:flutter/material.dart';

class Tab_bar_categories extends StatelessWidget {
  const Tab_bar_categories({
    super.key,
    required this.tabController,
    required List<String> tags,
  }) : _tags = tags;

  final TabController? tabController;
  final List<String> _tags;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      indicatorColor: Colors.black,
      indicatorWeight: 2.0,
      labelStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: Colors.transparent,
      ),
      tabs: _tags.map((String name) => Tab(text: name)).toList(),
      labelColor: Colors.black,
    );
  }
}
