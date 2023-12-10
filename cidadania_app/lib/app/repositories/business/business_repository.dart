import 'dart:convert';

import 'package:cidadania_app/app/models/business_model.dart';
import 'package:cidadania_app/app/repositories/business/business_repository_interface.dart';
import 'package:cidadania_app/app/repositories/http_repository.dart';
import 'package:cidadania_app/app/repositories/load_overlay.dart';
import 'package:cidadania_app/app/repositories/local_db/local_db_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routefly/routefly.dart';

class BusinessRepository implements BusinessRepositoryInterface {
  final HttpRepository http = HttpRepository();
  final firestore = FirebaseFirestore.instance;
  final String businessDocument = "business";
  final LocalDBRepository localDB = GetIt.I.get<LocalDBRepository>();
  @override
  Future deleteBusiness({required String businessId,required BuildContext context}) async {
    try{
      LoadOverlay.getLoad("Deletando Negócio", context);
      await firestore.collection(businessDocument).doc(businessId).delete();
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
      if(await necessaryUpdate()){
        QuerySnapshot result = await firestore.collection(businessDocument).get();
        List<Map<String,dynamic>> datas = result.docs.map((e) => e.data() as Map<String,dynamic>).toList();
        List<BusinessModel> list = await syncLocalDB(business: datas);
        return list;
      } else {
        List<BusinessModel> localBusiness = await getLocalBusiness();
        return localBusiness;
      }
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
  
  @override
  Future syncLocalDB({required List<Map<String,dynamic>> business}) async {
    await localDB.insertData(data: jsonEncode(business), key: "local_business");
    await localDB.updateData(key:"business_verify", data:DateTime.now().toIso8601String());
    var list = await getLocalBusiness();
    return list;
  }
  
  @override
  Future<bool> necessaryUpdate() async {
    var result = await localDB.readData(key: 'business_verify');
    bool? admMode = await localDB.readData(key: "adm_mode");
    if(result == null || admMode == true) return true;
    DateTime lastUpdate = DateTime(DateTime.parse(result).year,DateTime.parse(result).month, DateTime.parse(result).day);
    DateTime currentDay = DateTime(DateTime.now().year,DateTime.now().month, DateTime.now().day);
    if(currentDay.isAfter(lastUpdate)){
      return true;
    }
    return false;
  }
  
  @override
  Future getLocalBusiness() async {
    var result = await localDB.readData(key:"local_business");
    return (jsonDecode(result) as List).map((e) => BusinessModel.fromJson(data:e)).toList();
  }

}