import 'package:cidadania_app/app/models/business_model.dart';
import 'package:cidadania_app/app/repositories/business/business_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:collection/collection.dart'; 


part 'business_controller.g.dart';

class BusinessController = _BusinessController with _$BusinessController;

abstract class _BusinessController with Store {
  final BusinessRepository businessRepository = BusinessRepository();
  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  ObservableList<BusinessModel> business = <BusinessModel>[].asObservable();
  @observable
  bool loadAllBusiness = false;
  @observable
  ObservableList<BusinessModel> businessSearch = <BusinessModel>[].asObservable();

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
      businessSearch.clear();
      businessSearch.addAll(list);
    }
  }

  @action
  getAllBusiness() async {
    if(business.isEmpty)
    business.addAll(await businessRepository.getAllBusiness());
    if(business.isNotEmpty) loadAllBusiness = true;
    changeSearch();
  }

  @action
  Future<BusinessModel?> getOnlyBusiness({required String businessId}) async {
    if(loadAllBusiness){
      return business.firstWhereOrNull((element) => element.id == businessId);
    } else {
      await getAllBusiness();
      return business.firstWhereOrNull((element) => element.id == businessId);
    }
  }

  @action
  deleteBusiness({required String businessId}) async {
    deleteBusiness(businessId: businessId);
    business.removeWhere((element) => element.id == businessId);
    return true;
  }
}
