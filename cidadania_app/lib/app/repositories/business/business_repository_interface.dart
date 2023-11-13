import 'package:cidadania_app/app/models/business_model.dart';
import 'package:flutter/material.dart';

abstract class BusinessRepositoryInterface {
  Future getAllBusiness();
  Future getOnlyBusiness({required int businessId,required BuildContext context});
  Future<BusinessModel?> putBusiness({required BusinessModel businessModel,required BuildContext context});
  Future deleteBusiness({required int businessId,required BuildContext context});
  Future<BusinessModel?> addBusiness({required BusinessModel businessModel,required BuildContext context});
}