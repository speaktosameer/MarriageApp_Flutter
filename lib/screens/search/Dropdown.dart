import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({
    required this.label,
    required this.items,
    required this.onchanged,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String label;
  final List<String> items;
  final String value;
  final void Function(String?) onchanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: value,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.keyboard_arrow_down),
        isExpanded: true,
        dropdownColor: Colors.white,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: onchanged);
  }
}
