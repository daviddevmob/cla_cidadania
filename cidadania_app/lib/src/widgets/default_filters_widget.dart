import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultFiltersWidget extends StatelessWidget {
  final double? width;
  final List<String> filters;
  final Function(String)? toggle;
  const DefaultFiltersWidget({super.key, this.width, required this.filters, this.toggle});

  static final List<String> values = [
    "Aceita cartão de crédito",
    "Aceita pix",
    "Aceita pagamento em dinheiro",
    "Faz agendamento",
    "Atende por Whatsapp",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 300,
      child: Column(
        children: [
          Text("Selecione informações que são importantes sobre o negócio", style: CustomStyle.medium,),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: values.map((e) => FilterWidget(value: e, active: filters.firstWhereOrNull((element) => element == e) != null, toggle: toggle,)).toList(),
          ),
        ],
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  final String value;
  final bool active;
  final Function(String)? toggle;
  const FilterWidget({super.key, required this.value, required this.active, this.toggle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        toggle!(value);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8,vertical: 4,
        ),
        decoration: BoxDecoration(
          color: active ? CustomColors.primaryColor : CustomColors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(value, style: CustomStyle.little.copyWith(
          color:Colors.white 
        ),),
      ),
    );
  }
}
