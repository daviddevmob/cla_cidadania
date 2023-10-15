import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/repositories/business/business_repository.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdmController extends GetxController {
  final Rx<TextEditingController> user = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;
  final BusinessRepository businessRepository = BusinessRepository();

  login() async {
    if(user.value.text == "adm" && password.value.text == "123"){
      return true;
    } else {
      var result = await showAlertDialog(
        context: Get.context!, 
        title: "Dados Incorretos", 
        message: "Por favor, verifique as credenciais",
        actions: [
          AlertDialogAction(key: 'key', label: 'Ok', isDefaultAction: true, textStyle: CustomStyle.medium),
        ]
      );
      print(result);
      return false;
    }
  }

  
  postAddBusiness({required BusinessModel businessModel}) async {
    var result = await businessRepository.addBusiness(businessModel: businessModel);
    return result;
  }

  putUpdateBusiness({required BusinessModel businessModel, required int businessId}) async {
    var result = await businessRepository.putBusiness(businessModel: businessModel);
    return result;
  }

  delDeleteBusiness({required int businessId}) async {
    var result = await businessRepository.deleteBusiness(businessId: businessId);
    return result;
  }
}