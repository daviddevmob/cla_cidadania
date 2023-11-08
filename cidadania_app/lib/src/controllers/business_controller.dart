import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/repositories/business/business_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BusinessController extends GetxController {
  final Rx<TextEditingController> searchController =
      TextEditingController().obs;
  final BusinessRepository businessRepository = BusinessRepository();

  RxList<BusinessModel> business = <BusinessModel>[].obs;
  RxBool loadAllBusiness = false.obs;
  RxList<BusinessModel> businessSearch = <BusinessModel>[].obs;

  changeSearch(){
    if(searchController.value.text.isEmpty || searchController.value.text == ""){
      businessSearch.value = business;
      businessSearch.refresh();
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
      }).toList().obs;
      businessSearch.value = list;
      businessSearch.refresh();
    }
  }

  getAllBusiness() async {
    if(business.isEmpty)
    business.value = await businessRepository.getAllBusiness();
    business.refresh();
    if(business.isNotEmpty) loadAllBusiness.value = true;
    changeSearch();
  }

  getOnlyBusiness({required int businessId}) async {
    if(loadAllBusiness.value){
      getAllBusiness();
      return business.firstWhereOrNull((element) => element.id == businessId);
    } else {
      await getAllBusiness();
      return business.firstWhereOrNull((element) => element.id == businessId);
    }
  }
}
