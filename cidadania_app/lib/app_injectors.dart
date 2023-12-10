import 'package:cidadania_app/app/controllers/adm_controller.dart';
import 'package:cidadania_app/app/repositories/local_db/local_db_repository.dart';
import 'package:get_it/get_it.dart';

import 'app/controllers/business_controller.dart';

class AppIntectors {
   static final AppIntectors instance = AppIntectors._();
  AppIntectors._();

  void initialize(){
    //Stores Injection
	  GetIt.I.registerLazySingleton<BusinessController>(() => BusinessController());
	  GetIt.I.registerLazySingleton<AdmController>(() => AdmController());

    //Repositories Injection
	  GetIt.I.registerLazySingleton<LocalDBRepository>(() => LocalDBRepository());
  }
}