import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_store/screen/home/widgets/Tab_bar_categories/Tab_bar_categories.dart';
import 'package:stock_store/screen/home/widgets/app_bar/app_bar.dart';
import 'package:stock_store/screen/home/widgets/list_view_product/list_view_product.dart';
import 'package:stock_store/screen/profile/profile_screen.dart';

import '../../constants/constants.dart';
import '../moreSupplier/more_supplier_screen.dart';
import 'bloc/home_bloc_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final HomeBlocBloc _providerHomeBloc =
      BlocProvider.of<HomeBlocBloc>(context);
  bool _disposed = false;

  final List _screens = [
    const Home(),
    const moreSupplierScreen(),
    const ProfileScreen(),
  ];

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
    if (_providerHomeBloc.isClosed) {
      return;
    }
    super.initState();

    _providerHomeBloc.add(HomeBlocGetAllProducts(
      category: _tags[0],
    ));

    tabController = TabController(
      length: _tags.length,
      vsync: this,
    );

    tabController!.addListener(whenTabChange);
  }

  void whenTabChange() {
    _providerHomeBloc.add(HomeBlocGetAllProducts(
      category: _tags[tabController!.index],
    ));
  }

  // @override
  // void didChangeDependencies() {
  //   _providerHomeBloc = BlocProvider.of<HomeBlocBloc>(context);

  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    // TODO: implement dispose

    _disposed = true;
    if (mounted && tabController != null) {
      tabController?.dispose();
    }

    // _providerHomeBloc.close();

    super.dispose();
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
      child: BlocListener<HomeBlocBloc, HomeBlocState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is HomeBlocError) {
            print("erro");

            if (state.message!.contains("Unauthorized")) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            }
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
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
        ),
      ),
    );
  }
}
