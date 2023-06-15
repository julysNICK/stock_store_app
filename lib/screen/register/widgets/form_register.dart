import 'package:flutter/material.dart';

import 'input_password_register.dart';
import 'input_text_register.dart';

Column form_register(
  TextEditingController name,
  TextEditingController address,
  TextEditingController contactEmail,
  TextEditingController contactPhone,
  TextEditingController password,
) {
  return Column(
    children: [
      input_text(name, "Name"),
      input_text(address, "Address"),
      input_text(contactEmail, "Email"),
      input_text(contactPhone, "Phone"),
      input_password(
        password,
        "Password",
      ),
    ],
  );
}
