import 'package:cidadania_app/app/repositories/local_db/local_db_repository_interface.dart';
import 'package:get_storage/get_storage.dart';

class LocalDBRepository implements LocalDBRepositoryInterface {

  final box = GetStorage();

  @override
  Future deleteData({required String key})  async {
    await box.remove(key);
  }

  @override
  Future insertData({required data, required String key}) async {
    await box.write(key, data);
  }

  @override
  Future readData({required String key}) async {
    var result = await box.read(key);
    return result;
  }

  @override
  Future updateData({required data, required String key}) async {
    await box.write(key, data);
  }

}