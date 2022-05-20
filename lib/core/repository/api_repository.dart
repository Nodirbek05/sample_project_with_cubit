import 'package:apifetchwithcubit/core/models/post_models.dart';
import 'package:apifetchwithcubit/service/api_service.dart';

class ApiRepository{
  final ApiService api_service;

  ApiRepository({required this.api_service});
  Future<List<PostModels>?> getPostList() async 
  {
    final response = await api_service.getPostData();
   if(response != null ){
      final data = response.data as List<dynamic>;
      return data.map((e) => PostModels.fromJson(e)).toList(); 
   }
    
  } 
}