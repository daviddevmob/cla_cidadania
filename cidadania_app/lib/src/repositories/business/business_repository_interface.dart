import 'package:cidadania_app/src/models/business_model.dart';

abstract class BusinessRepositoryInterface {
  Future getAllBusiness();
  Future getOnlyBusiness({required int businessId});
  Future<BusinessModel?> putBusiness({required BusinessModel businessModel});
  Future deleteBusiness({required int businessId});
  Future<BusinessModel?> addBusiness({required BusinessModel businessModel});
}