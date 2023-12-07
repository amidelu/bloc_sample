import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T)? itemAsString;
  final Function(T?) onChanged;
  final String? labelText;
  final String? hintText;
  final String? validationText;
  final String? Function(T?)? validator;
  final bool? isShowSearch;

  CustomDropdownSearch(
      {required this.items,
      this.itemAsString,
      required this.onChanged,
      required this.labelText,
      this.hintText,
      this.isShowSearch,
      this.validationText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: DropdownSearch<T>(
        items: items,
        popupProps: PopupProps.menu(
          showSearchBox: isShowSearch ?? true,
        ),
        itemAsString: itemAsString,
        onChanged: onChanged,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              labelText: labelText ?? '', hintText: hintText ?? ''),
        ),
        validator: (value) {
          if (value == null) {
            return validationText ?? 'This field is required!';
          }
          return null;
        },
      ),
    );
  }
}
