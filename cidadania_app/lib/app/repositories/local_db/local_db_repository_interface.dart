abstract class LocalDBRepositoryInterface {
  Future readData({required String key});
  Future insertData({required dynamic data, required String key});
  Future updateData({required dynamic data, required String key});
  Future deleteData({required String key});
}