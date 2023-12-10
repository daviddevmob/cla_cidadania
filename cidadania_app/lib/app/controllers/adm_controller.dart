import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cidadania_app/app/models/business_model.dart';
import 'package:cidadania_app/app/repositories/business/business_repository.dart';
import 'package:cidadania_app/app/repositories/local_db/local_db_repository.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'adm_controller.g.dart';

class AdmController = _AdmController with _$AdmController;

abstract class _AdmController with Store {

  final BusinessRepository businessRepository = BusinessRepository();
  final LocalDBRepository localDB = GetIt.I.get<LocalDBRepository>();

  @action
  login({required BuildContext context}) async {
    bool? admMode = await localDB.readData(key: "adm_mode");
    if(admMode == true) return true;
    var data = await showTextInputDialog(
      context: context, 
      textFields: [
        DialogTextField(hintText: "E-mail", ),
        DialogTextField( hintText: "Senha",obscureText: true),
      ],
      okLabel: "Entrar",
      cancelLabel: "Cancelar",
      style: AdaptiveStyle.adaptive,
    );
    if(data?[0] == "adm" && data?[1]  == "123"){
      await localDB.insertData(data: true, key: "adm_mode");
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
  isAdmMode() async {
    bool? result = await localDB.readData(key: "adm_mode");
    return (result == true);
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
  delDeleteBusiness({required String businessId, required BuildContext context}) async {
    var dialog = await showOkCancelAlertDialog(
      context: context,
      title: "Deletar Negócio",
      message: "Tem certeza que deseja deletar este negócio?",
      okLabel: "Deletar",
      isDestructiveAction: true,
    );
    if(dialog == OkCancelResult.cancel) return false;
    var result = await businessRepository.deleteBusiness(businessId: businessId, context:  context);
    return result;
  }

}