abstract class HttpRepositoryInterface {
  Future get({required String path});
  Future post({required String path, Map<String,dynamic>? data});
  Future put({required String path, Map<String,dynamic>? data});
  Future del({required String path});
}