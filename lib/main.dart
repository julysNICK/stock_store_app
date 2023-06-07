import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_store/screen/details/bloc/detail_product_bloc.dart';
import 'package:stock_store/screen/home/bloc/home_bloc_bloc.dart';
import 'package:stock_store/screen/home/home_screen.dart';
import 'package:stock_store/screen/moreSupplier/more_supplier_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider<HomeBlocBloc>(
          create: (context) => HomeBlocBloc(),
        ),
        BlocProvider<DetailProductBloc>(
          create: (context) => DetailProductBloc(),
        ),
      ],
      child: const MyApp(),
    ));
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/supplier': (context) => const moreSupplierScreen()
      },
    );
  }
}
