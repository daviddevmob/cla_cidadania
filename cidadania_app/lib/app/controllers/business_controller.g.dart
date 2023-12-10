// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BusinessController on _BusinessController, Store {
  late final _$searchControllerAtom =
      Atom(name: '_BusinessController.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$businessAtom =
      Atom(name: '_BusinessController.business', context: context);

  @override
  ObservableList<BusinessModel> get business {
    _$businessAtom.reportRead();
    return super.business;
  }

  @override
  set business(ObservableList<BusinessModel> value) {
    _$businessAtom.reportWrite(value, super.business, () {
      super.business = value;
    });
  }

  late final _$loadAllBusinessAtom =
      Atom(name: '_BusinessController.loadAllBusiness', context: context);

  @override
  bool get loadAllBusiness {
    _$loadAllBusinessAtom.reportRead();
    return super.loadAllBusiness;
  }

  @override
  set loadAllBusiness(bool value) {
    _$loadAllBusinessAtom.reportWrite(value, super.loadAllBusiness, () {
      super.loadAllBusiness = value;
    });
  }

  late final _$businessSearchAtom =
      Atom(name: '_BusinessController.businessSearch', context: context);

  @override
  ObservableList<BusinessModel> get businessSearch {
    _$businessSearchAtom.reportRead();
    return super.businessSearch;
  }

  @override
  set businessSearch(ObservableList<BusinessModel> value) {
    _$businessSearchAtom.reportWrite(value, super.businessSearch, () {
      super.businessSearch = value;
    });
  }

  late final _$getAllBusinessAsyncAction =
      AsyncAction('_BusinessController.getAllBusiness', context: context);

  @override
  Future getAllBusiness() {
    return _$getAllBusinessAsyncAction.run(() => super.getAllBusiness());
  }

  late final _$getOnlyBusinessAsyncAction =
      AsyncAction('_BusinessController.getOnlyBusiness', context: context);

  @override
  Future<BusinessModel?> getOnlyBusiness({required String businessId}) {
    return _$getOnlyBusinessAsyncAction
        .run(() => super.getOnlyBusiness(businessId: businessId));
  }

  late final _$deleteBusinessAsyncAction =
      AsyncAction('_BusinessController.deleteBusiness', context: context);

  @override
  Future deleteBusiness({required String businessId}) {
    return _$deleteBusinessAsyncAction
        .run(() => super.deleteBusiness(businessId: businessId));
  }

  late final _$_BusinessControllerActionController =
      ActionController(name: '_BusinessController', context: context);

  @override
  dynamic changeSearch() {
    final _$actionInfo = _$_BusinessControllerActionController.startAction(
        name: '_BusinessController.changeSearch');
    try {
      return super.changeSearch();
    } finally {
      _$_BusinessControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchController: ${searchController},
business: ${business},
loadAllBusiness: ${loadAllBusiness},
businessSearch: ${businessSearch}
    ''';
  }
}
