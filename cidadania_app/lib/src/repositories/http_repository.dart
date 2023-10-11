import 'package:cidadania_app/src/repositories/http_repository_interface.dart';
import 'package:cidadania_app/src/routes/route_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpRepository implements HttpRepositoryInterface{
  final Dio dio = Dio();
  @override
  Future get({required String path}) async {
    try{
      var result = await dio.get(RouteApi.baseURL + path);
      return result.data;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future post({required String path, Map<String, dynamic>? data}) async {
    try{
      var result = await dio.post(RouteApi.baseURL + path, data: data);
      return result.data;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }
  
  @override
  Future del({required String path}) async {
     try{
      var result = await dio.delete(RouteApi.baseURL + path);
      return result.data;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }
  
  @override
  Future put({required String path, Map<String, dynamic>? data}) async {
    try{
      var result = await dio.put(RouteApi.baseURL + path, data: data);
      return result.data;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

}