import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/responsive.dart';
import 'package:flutter/material.dart';

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
      width: width ?? Responsive.sizeWidthFields(context),
      child: Column(
        children: [
          Text("Selecione informações que são importantes sobre o negócio", style: CustomStyle.medium,),
          SizedBox(
            height: 5,
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: values.map((e) => FilterWidget(value: e, active: filters.where((element) => element == e).isNotEmpty, toggle: toggle,)).toList(),
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
