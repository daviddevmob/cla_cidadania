import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/responsive.dart';
import 'package:flutter/material.dart';

class DefaultDropdownButtonWidget extends StatelessWidget {
  final String? currentValue;
  final Function(dynamic)? onChanged;
  final List<String> items;
  final String label;
  const DefaultDropdownButtonWidget({super.key, this.currentValue, this.onChanged, required this.items, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CustomStyle.medium,),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 48,
          width: Responsive.sizeWidthFields(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.lightGrey,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10,vertical: 5,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String?>(
              value: currentValue,
              hint: Text(label, style: CustomStyle.medium,),
              items: items.map((e) => DropdownMenuItem(child: Text(e, style: CustomStyle.medium,),value: e,)).toList(),
              onChanged: onChanged,
              ),
          ),
        ),
      ],
    );
  }
}