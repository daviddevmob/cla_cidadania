import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/repositories/business/business_repository_interface.dart';
import 'package:cidadania_app/src/repositories/http_repository.dart';
import 'package:cidadania_app/src/routes/route_api.dart';
import 'package:flutter/material.dart';

class BusinessRepository implements BusinessRepositoryInterface {
  final HttpRepository http = HttpRepository();
  @override
  Future deleteBusiness({required int businessId}) async {
    try{
      var result = http.get(path: "${RouteApi.business}$businessId");
      return result;
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future getAllBusiness() async {
     try{
      var result = await http.get(path: "${RouteApi.business}");
      return (result as List).map((e) => BusinessModel.fromJson(data: e)).toList();
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future getOnlyBusiness({required int businessId}) async {
      try{
      var result = http.del(path: "${RouteApi.business}$businessId");
      return result;
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future putBusiness({required BusinessModel businessModel}) async {
    try{
      var result = http.put(
        path: "${RouteApi.business}${businessModel.id}", 
        data: businessModel.toJson()
      );
      return result;
    }catch(e){
      debugPrint(e.toString());
    }
  }
  
  @override
  Future addBusiness({required BusinessModel businessModel}) async {
     try{
      var result = await http.post(
        path: "${RouteApi.business}", 
        data: businessModel.toJson()
      );
      return result;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

}