import 'package:flutter/material.dart';

import '../../../models/store.dart';

Column form_login(TextEditingController email, TextEditingController password,
    StoreInputsLogin storeInputsLogin) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: TextField(
          controller: email,
          onChanged: (value) {
            storeInputsLogin.email = value;
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Email or Phone number",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          obscureText: true,
          controller: password,
          onChanged: (value) {
            storeInputsLogin.password = value;
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  );
}
