import 'package:cidadania_app/app/repositories/converter.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadOverlay {
  LoadOverlay._();

  static getLoad(String? title, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (_) => Dialog(
         child: Container(
          height: 200,
            decoration: BoxDecoration(
              color: CustomColors.backgroudColor.withOpacity(.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title ?? "Carregando",
                  style: CustomStyle.title,
                ),
                Lottie.asset(
                    'assets/load.json',
                    height: 100,
                    fit: BoxFit.contain,
                    repeat: true,
                  ),
              ],
            ),
             ),
       ),);
  }

  static showImage({required String url, required BuildContext context}) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_){
        return Dialog(
          backgroundColor: CustomColors.backgroudColor,
          child: Stack(
            children: [
              Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(ConverterRepository.base64ToBytes(image: url)),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: (){
                  Navigator.pop(context);
                  }, 
                  child: Text(
                    "Fechar",
                    style: CustomStyle.medium,
                  )
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}