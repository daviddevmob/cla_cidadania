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
  getAllBusiness() async {
    business.value = await businessRepository.getAllBusiness();
    business.refresh();
    if(business.isNotEmpty) loadAllBusiness.value = true;
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

  postAddBusiness({required BusinessModel businessModel}) async {
    var result = await businessRepository.addBusiness(businessModel: businessModel);
    return result;
  }

  putUpdateBusiness({required BusinessModel businessModel}) async {
    var result = await businessRepository.putBusiness(businessModel: businessModel);
    return result;
  }

  delDeleteBusiness({required int businessId}) async {
    var result = await businessRepository.deleteBusiness(businessId: businessId);
    return result;
  }

  
}
