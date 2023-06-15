import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_store/screen/details/bloc/detail_product_bloc.dart';
import 'package:stock_store/screen/details_supplier/bloc/detail_supplier_bloc.dart';
import 'package:stock_store/screen/home/bloc/home_bloc_bloc.dart';
import 'package:stock_store/screen/home/home_screen.dart';
import 'package:stock_store/screen/login/bloc/login_bloc.dart';
import 'package:stock_store/screen/login/login_screen.dart';
import 'package:stock_store/screen/moreSupplier/bloc/supplier_bloc.dart';
import 'package:stock_store/screen/moreSupplier/more_supplier_screen.dart';
import 'package:stock_store/screen/register/bloc/register_bloc.dart';
import 'package:stock_store/screen/register/register_screen.dart';

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
        BlocProvider<SupplierBloc>(
          create: (context) => SupplierBloc(),
        ),
        BlocProvider<DetailSuppBloc>(
          create: (context) => DetailSuppBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
          child: const login_screen(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
          child: const Register_screen(),
        ),
      ],
      child: const MyApp(),
    ));
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register_screen(),
      routes: {
        '/home': (context) => const Home(),
        '/supplier': (context) => const moreSupplierScreen()
      },
    );
  }
}
