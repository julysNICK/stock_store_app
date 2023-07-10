import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stock_store/widgets/popup_error.dart';

import '../../models/store.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Login_store? loginJson;
  @override
  void initState() {
    print("initState");
    // TODO: implement initState
    super.initState();
    getCredentials();
  }

  Future<void> getCredentials() async {
    try {
      Map<String, String> allValues = await storage.readAll();

      final decodeJsonStore = jsonDecode(allValues['token']!);
      print(decodeJsonStore);

      setState(() {
        loginJson = Login_store.fromJson(decodeJsonStore);
      });
    } catch (e) {
      print(e);

      showDialog(
        context: context,
        builder: (context) =>
            const Popup_Error(errorMessage: "Erro ao carregar dados"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double heightBackgroundBlack =
        MediaQuery.of(context).size.height * 0.3;

    final double positionedTop = heightBackgroundBlack - 48;

    final double marginBottom = MediaQuery.of(context).size.height * 0.05;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 0,
            right: 0,
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 85,
                  ),
                  height: heightBackgroundBlack,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                        top: positionedTop,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Text(
                    loginJson?.store.name ?? "Carregando...",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    loginJson?.store.contactEmail ?? "Carregando...",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),

                //make a thin stripe with container
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.5),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconProfile(
                      title: "Endereço",
                      subtitle: loginJson?.store.address ?? "Carregando...",
                    ),
                    iconProfile(
                      title: "Telefone",
                      subtitle:
                          loginJson?.store.contactPhone ?? "Carregando...",
                    ),
                    iconProfile(
                      title: "Crianção da Conta",
                      subtitle: loginJson?.store.createdAt ?? "Carregando...",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class iconProfile extends StatelessWidget {
  String? title;
  String? subtitle;
  iconProfile({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.streetview,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.21,
                    child: Text(
                      title ?? "Carregando...",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.21,
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Center(
                      child: Text(
                    subtitle ?? "Carregando...",
                    softWrap: true,
                  ))),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Container(
            height: 90,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
