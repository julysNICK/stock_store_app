import 'package:flutter/material.dart';

class DropdownQuantity extends StatefulWidget {
  String dropdownValue = '1';
  void Function(String?)? onChanged;
  DropdownQuantity({
    super.key,
    required this.dropdownValue,
    required this.onChanged,
  });

  @override
  State<DropdownQuantity> createState() => _DropdownQuantityState();
}

class _DropdownQuantityState extends State<DropdownQuantity> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: const [
        DropdownMenuItem<String>(
          value: '1',
          child: Text('1'),
        ),
        DropdownMenuItem<String>(
          value: '2',
          child: Text('2'),
        ),
        DropdownMenuItem<String>(
          value: '3',
          child: Text('3'),
        ),
        DropdownMenuItem<String>(
          value: '4',
          child: Text('4'),
        ),
        DropdownMenuItem<String>(
          value: '5',
          child: Text('5'),
        ),
        DropdownMenuItem<String>(
          value: '6',
          child: Text('6'),
        ),
        DropdownMenuItem<String>(
          value: '7',
          child: Text('7'),
        ),
        DropdownMenuItem<String>(
          value: '8',
          child: Text('8'),
        ),
        DropdownMenuItem<String>(
          value: '9',
          child: Text('9'),
        ),
        DropdownMenuItem<String>(
          value: '10',
          child: Text('10'),
        ),
      ],
      onChanged: widget.onChanged,
      icon: const Icon(Icons.arrow_drop_down),
    );
  }
}
