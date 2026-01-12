import 'package:flutter/material.dart';

class SearchableCustomerDropdown extends StatefulWidget {
  final List<String> items;
  const SearchableCustomerDropdown({super.key, required this.items});

  @override
  State<SearchableCustomerDropdown> createState() =>
      _SearchableCustomerDropdownState();
}

class _SearchableCustomerDropdownState
    extends State<SearchableCustomerDropdown> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selected,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down),
      hint: const Text(
        "-- select --",
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF6B7280),
        ),
      ),
      items: widget.items
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (v) => setState(() => selected = v),
      decoration: const InputDecoration(
        isDense: true,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      ),
    );
  }
}
