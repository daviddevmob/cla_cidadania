// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adm_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdmController on _AdmController, Store {
  late final _$userAtom = Atom(name: '_AdmController.user', context: context);

  @override
  TextEditingController get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(TextEditingController value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AdmController.password', context: context);

  @override
  TextEditingController get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(TextEditingController value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AdmController.login', context: context);

  @override
  Future login({required BuildContext context}) {
    return _$loginAsyncAction.run(() => super.login(context: context));
  }

  late final _$postAddBusinessAsyncAction =
      AsyncAction('_AdmController.postAddBusiness', context: context);

  @override
  Future postAddBusiness(
      {required BusinessModel businessModel, required BuildContext context}) {
    return _$postAddBusinessAsyncAction.run(() =>
        super.postAddBusiness(businessModel: businessModel, context: context));
  }

  late final _$putUpdateBusinessAsyncAction =
      AsyncAction('_AdmController.putUpdateBusiness', context: context);

  @override
  Future putUpdateBusiness(
      {required BusinessModel businessModel,
      required String businessId,
      required BuildContext context}) {
    return _$putUpdateBusinessAsyncAction.run(() => super.putUpdateBusiness(
        businessModel: businessModel,
        businessId: businessId,
        context: context));
  }

  late final _$delDeleteBusinessAsyncAction =
      AsyncAction('_AdmController.delDeleteBusiness', context: context);

  @override
  Future delDeleteBusiness(
      {required int businessId, required BuildContext context}) {
    return _$delDeleteBusinessAsyncAction.run(() =>
        super.delDeleteBusiness(businessId: businessId, context: context));
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password}
    ''';
  }
}
