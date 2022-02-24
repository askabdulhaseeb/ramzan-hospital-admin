import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../models/department.dart';

class DepartmentDropdown extends StatelessWidget {
  const DepartmentDropdown({
    required this.items,
    required this.onChanged,
    this.selectedItem,
    this.borderRadius,
    this.color,
    this.hintText = 'Department',
    this.margin,
    this.padding,
    Key? key,
  }) : super(key: key);
  final List<Department> items;
  final Department? selectedItem;
  final BorderRadiusGeometry? borderRadius;
  final void Function(Department?) onChanged;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final String hintText;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Department>(
      showSearchBox: true,
      dropdownSearchTextAlignVertical: TextAlignVertical.center,
      mode: Mode.MENU,
      selectedItem: selectedItem,
      items: items,
      dropdownSearchBaseStyle: const TextStyle(color: Colors.white),
      itemAsString: (Department? item) => item!.name,
      onChanged: (Department? value) => onChanged(value),
      showAsSuffixIcons: true,
      validator: (Department? value) {
        if (value == null) return 'Category Required';
        return null;
      },
      dropdownSearchDecoration: InputDecoration(
        hintText: hintText,
        contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
