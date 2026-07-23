import 'package:dio/dio.dart';
import 'package:flutter_app/services/api_services.dart';

class PostService {
  Future<Response> getPosts() async {
    final response = await ApiServices.get('/posts');
    return response;
  }

  Future<Response> createPosts({
    required String title,
    required String body,
  }) async {
    final response = await ApiServices.post('/posts', {
      "title": title,
      "body": body,
      "userId": 1,
    });
    return response;
  }

  Future<Response> updatePosts({
    required int id,
    required String title,
    required String body,
  }) async {
    final response = await ApiServices.put('/posts/$id', {
      "title": title,
      "body": body,
      "userId": 1,
    });
    return response;
  }

  Future<Response> deletePosts({required int id}) async {
    final response = await ApiServices.delete('/posts/$id');
    return response;
  }
}
