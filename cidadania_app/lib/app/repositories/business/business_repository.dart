import 'package:cidadania_app/app/models/business_model.dart';
import 'package:cidadania_app/app/repositories/business/business_repository_interface.dart';
import 'package:cidadania_app/app/repositories/http_repository.dart';
import 'package:cidadania_app/app/repositories/load_overlay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class BusinessRepository implements BusinessRepositoryInterface {
  final HttpRepository http = HttpRepository();
  final firestore = FirebaseFirestore.instance;
  final String businessDocument = "business";
  @override
  Future deleteBusiness({required int businessId,required BuildContext context}) async {
    try{
      LoadOverlay.getLoad("Deletando Negócio", context);
      await firestore.collection(businessDocument).doc(businessId.toString()).delete();
      Routefly.pop(context);
      return true;
    }catch(e){
      Routefly.pop(context);
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future getAllBusiness() async {
     try{
      QuerySnapshot result = await firestore.collection(businessDocument).get();
      List<Map<String,dynamic>> datas = result.docs.map((e) => e.data() as Map<String,dynamic>).toList();
      return datas.map((e) => BusinessModel.fromJson(data: e)).toList();
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future getOnlyBusiness({required int businessId,required BuildContext context}) async {
      try{
      var result = firestore.collection(businessDocument).doc(businessId.toString()).get();
      return result;
    }catch(e){
      Routefly.pop(context);
      debugPrint(e.toString());
    }
  }

  @override
  Future<BusinessModel?> putBusiness({required BusinessModel businessModel,required BuildContext context}) async {
    try{
      LoadOverlay.getLoad("Atualizando Negócio", context);
      await firestore.collection(businessDocument).doc(businessModel.id).set(businessModel.toJson());
      Routefly.pop(context);
      return businessModel;
    }catch(e){
      Routefly.pop(context);
      debugPrint(e.toString());
      return null;
    }
  }
  
  @override
  Future<BusinessModel?> addBusiness({required BusinessModel businessModel,required BuildContext context}) async {
     try{
      LoadOverlay.getLoad("Adicionando Negócio", context);
      await firestore.collection(businessDocument).doc(businessModel.id).set(businessModel.toJson());
      Routefly.pop(context);
      return businessModel;
    }catch(e){
      Routefly.pop(context);
      debugPrint(e.toString());
      return null;
    }
  }

}