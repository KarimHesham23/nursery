import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/utils/styles.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {super.key,
      required this.hintText,
      required this.items,
      required this.onSaved,
      required this.onChanged});
  final String hintText;
  final List<String> items;
  final Function(String?) onSaved;
  final Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor,
          hintText: hintText,
          contentPadding: const EdgeInsets.only(
            top: 6,
            bottom: 6,
            right: 16,
          ),
          hintStyle: Styles.styleText14.copyWith(color: Colors.white),
          prefixIconColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: kSpecialColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: kSpecialColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        hint: Text(
          hintText,
          style: Styles.styleText14.copyWith(
            color: Colors.white,
          ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList(),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "This Filed Required";
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        onChanged: onChanged,
        iconStyleData: const IconStyleData(
            icon: Icon(
              FontAwesomeIcons.circleArrowRight,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.white,
            openMenuIcon: Icon(
              FontAwesomeIcons.circleChevronDown,
              color: kSpecialColor,
              size: 14,
            )),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kSecondaryColor,
          ),
          offset: const Offset(0, -5),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
