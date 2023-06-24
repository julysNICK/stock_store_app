import 'package:flutter/material.dart';

import '../../widgets/bottomBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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

                const Center(
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Email',
                    style: TextStyle(
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
                  children: const [
                    iconProfile(),
                    iconProfile(),
                    iconProfile(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }
}

class iconProfile extends StatelessWidget {
  const iconProfile({
    super.key,
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
                children: const [
                  Icon(
                    Icons.streetview,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                  child: const Center(
                      child: Text(
                    "lorem lowlkjeeiowfjweiojfeowijifrem",
                    softWrap: true,
                  ))),
            ],
          ),
          const SizedBox(
            width: 10,
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
