import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cidadania_app/app/models/business_model.dart';
import 'package:cidadania_app/app/repositories/business/business_repository.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'adm_controller.g.dart';

class AdmController = _AdmController with _$AdmController;

abstract class _AdmController with Store {

  final BusinessRepository businessRepository = BusinessRepository();
  
  @observable
  TextEditingController user = TextEditingController();
  
  @observable
  TextEditingController password = TextEditingController();

  @action
  login({required BuildContext context}) async {
    if(user.value.text == "adm" && password.value.text == "123"){
      return true;
    } else {
      var result = await showAlertDialog(
        context: context, 
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

  @action
  postAddBusiness({required BusinessModel businessModel, required BuildContext context}) async {
    var result = await businessRepository.addBusiness(businessModel: businessModel, context: context);
    return result;
  }

  @action
  putUpdateBusiness({required BusinessModel businessModel, required String businessId, required BuildContext context}) async {
    var result = await businessRepository.putBusiness(businessModel: businessModel, context: context);
    return result;
  }

  @action
  delDeleteBusiness({required int businessId, required BuildContext context}) async {
    var result = await businessRepository.deleteBusiness(businessId: businessId, context:  context);
    return result;
  }
}