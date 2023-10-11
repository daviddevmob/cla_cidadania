import 'package:cidadania_app/src/models/business_model.dart';

abstract class BusinessRepositoryInterface {
  Future getAllBusiness();
  Future getOnlyBusiness({required int businessId});
  Future putBusiness({required BusinessModel businessModel});
  Future deleteBusiness({required int businessId});
  Future addBusiness({required BusinessModel businessModel});
}