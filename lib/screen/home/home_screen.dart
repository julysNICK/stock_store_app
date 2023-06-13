import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_store/screen/home/widgets/Tab_bar_categories/Tab_bar_categories.dart';
import 'package:stock_store/screen/home/widgets/app_bar/app_bar.dart';
import 'package:stock_store/screen/home/widgets/list_view_product/list_view_product.dart';

import '../../constants/constants.dart';
import '../../widgets/bottomBar.dart';
import 'bloc/home_bloc_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? tabController;

  final List<String> _tags = [
    "All",
    "Technology",
    "Health",
    "Finance",
    // "Energy",
    // "Consumer",
    // "Transportation",
  ];
  var searchProduct;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<HomeBlocBloc>(context).add(HomeBlocGetAllProducts(
      category: _tags[0],
    ));

    tabController = TabController(
      length: _tags.length,
      vsync: this,
    );

    tabController!.addListener(whenTabChange);
  }

  void whenTabChange() {
    BlocProvider.of<HomeBlocBloc>(context).add(HomeBlocGetAllProducts(
      category: _tags[tabController!.index],
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<HomeBlocBloc>(context).close();
  }

  int _selectedIndex = 0;

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 15.0,
        ),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? AppColor.mainColorPrimary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color:
                _selectedIndex == index ? Colors.grey[800] : Colors.grey[400],
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tags.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Stock Market',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppFontSize.fontSizeTitle,
                        fontWeight: AppFontWeight.fontWeightBold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                Text(
                  'Welcome to the Stock Market App',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: AppFontSize.fontSizeBody,
                    fontWeight: AppFontWeight.fontWeightNormal,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const BarApp(),
                const SizedBox(
                  height: 25,
                ),
                Tab_bar_categories(tabController: tabController, tags: _tags),
                const SizedBox(
                  height: 25,
                ),
                Flexible(
                  child: TabBarView(controller: tabController, children: [
                    CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              BlocBuilder<HomeBlocBloc, HomeBlocState>(
                                builder: (context, state) {
                                  return buildProductListView(
                                    productDataTest: state.products,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              BlocBuilder<HomeBlocBloc, HomeBlocState>(
                                builder: (context, state) {
                                  return buildProductListView(
                                    productDataTest: state.products,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              BlocBuilder<HomeBlocBloc, HomeBlocState>(
                                builder: (context, state) {
                                  return buildProductListView(
                                    productDataTest: state.products,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              BlocBuilder<HomeBlocBloc, HomeBlocState>(
                                builder: (context, state) {
                                  return buildProductListView(
                                    productDataTest: state.products,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const bottomBar(),
      ),
    );
  }
}
