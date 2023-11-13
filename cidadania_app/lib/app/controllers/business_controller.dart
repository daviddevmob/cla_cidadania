import 'package:cidadania_app/app/models/business_model.dart';
import 'package:cidadania_app/app/repositories/business/business_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'business_controller.g.dart';

class BusinessController = _BusinessController with _$BusinessController;

abstract class _BusinessController with Store {
  final BusinessRepository businessRepository = BusinessRepository();
  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  List<BusinessModel> business = <BusinessModel>[];
  @observable
  bool loadAllBusiness = false;
  @observable
  List<BusinessModel> businessSearch = <BusinessModel>[];

  @action
  changeSearch(){
    if(searchController.value.text.isEmpty || searchController.value.text == ""){
      businessSearch = business;
    } else {
      var list = business.where((busi){
        String text = searchController.value.text;
        if(busi.name.toLowerCase().contains(text.toLowerCase())) return true;
        if(busi.category.toLowerCase().contains(text.toLowerCase())) return true;
        if(busi.filters.contains(text.toLowerCase())) return true;
        if(busi.instagram?.toLowerCase().contains(text.toLowerCase()) == true) return true;
        if(busi.whatsapp?.toLowerCase().contains(text.toLowerCase()) == true) return true;
        if(busi.phone?.toLowerCase().contains(text.toLowerCase()) == true) return true;
        if(busi.description?.toLowerCase().contains(text.toLowerCase()) == true) return true;
        return false;
      }).toList();
      businessSearch = list;
    }
  }

  @action
  getAllBusiness() async {
    if(business.isEmpty)
    business = await businessRepository.getAllBusiness();
    if(business.isNotEmpty) loadAllBusiness = true;
    changeSearch();
  }

  @action
  getOnlyBusiness({required String businessId}) async {
    if(loadAllBusiness){
      return business.firstWhere((element) => element.id == businessId);
    } else {
      await getAllBusiness();
      return business.firstWhere((element) => element.id == businessId);
    }
  }
}
