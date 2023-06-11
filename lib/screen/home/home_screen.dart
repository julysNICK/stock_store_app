import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_store/widgets/custom_icon_button.dart';

import '../../constants/constants.dart';
import '../../models/product.dart';
import '../../widgets/bottomBar.dart';
import '../../widgets/product_card.dart';
import '../details/details_screen.dart';
import 'bloc/home_bloc_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: _tags.length,
      child: Scaffold(
        key: scaffoldKey,
        // drawer: Drawer(
        //   child: ListView(
        //     children: [
        //       DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue[900],
        //         ),
        //         child: const Text(
        //           'Minha loja',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 24,
        //           ),
        //         ),
        //       ),
        //       ListTile(
        //         title: const Text('Item 1'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: const Text('Sair'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        // drawerDragStartBehavior: DragStartBehavior.down,
        // drawerEnableOpenDragGesture: true,
        // drawerScrimColor: Colors.black.withOpacity(0.5),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                      const Text(
                        'Stock Market',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: AppFontSize.fontSizeTitle,
                          fontWeight: AppFontWeight.fontWeightBold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                    ],
                  ),
                  Text('Welcome to the Stock Market App',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: AppFontSize.fontSizeBody,
                        fontWeight: AppFontWeight.fontWeightNormal,
                        fontFamily: 'Poppins',
                      )),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const BarApp(),
                  const SizedBox(
                    height: 25,
                  ),
                  // BlocBuilder<HomeBlocBloc, HomeBlocState>(
                  //   builder: (context, state) {
                  //     return Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: _tags
                  //           .asMap()
                  //           .entries
                  //           .map(
                  //             (MapEntry map) => _buildTags(
                  //               map.key,
                  //             ),
                  //           )
                  //           .toList(),
                  //     );
                  //   },
                  // ),

                  TabBar(
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
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: TabBarView(controller: tabController, children: [
                      BlocBuilder<HomeBlocBloc, HomeBlocState>(
                        builder: (context, state) {
                          return _buildProductListView(
                            productDataTest: state.products,
                          );
                        },
                      ),
                      BlocBuilder<HomeBlocBloc, HomeBlocState>(
                        builder: (context, state) {
                          return _buildProductListView(
                            productDataTest: state.products,
                          );
                        },
                      ),
                      BlocBuilder<HomeBlocBloc, HomeBlocState>(
                        builder: (context, state) {
                          return _buildProductListView(
                            productDataTest: state.products,
                          );
                        },
                      ),
                      BlocBuilder<HomeBlocBloc, HomeBlocState>(
                        builder: (context, state) {
                          return _buildProductListView(
                            productDataTest: state.products,
                          );
                        },
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const bottomBar(),
      ),
    );
  }

  Widget _buildProductListView({
    List<Product> productDataTest = const [],
  }) {
    return ListView.builder(
      itemCount: productDataTest.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => DetailsScreen(
                          product: productDataTest[index],
                        )),
                  ),
                );
              },
              child: ProductCard(
                product: productDataTest[index],
                isLiked: false,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        );
      },
    );
  }
}

class BarApp extends StatelessWidget {
  const BarApp({
    super.key,
  });

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
