import 'package:apifetchwithcubit/core/models/failure_api.dart';
import 'package:apifetchwithcubit/core/repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/models/post_models.dart';

part 'postfetchapi_state.dart';

class PostfetchapiCubit extends Cubit<PostfetchapiState> {
  PostfetchapiCubit({required this.apiRepository})
      : super(PostfetchapiInitial());

  final ApiRepository apiRepository;

  Future<void> postfetchApi() async {
    emit(PostfetchapiLoading());
    try {
      final List<PostModels>? postModels = await apiRepository.getPostList();
      emit(PostfetchapiLoaded(postModels: postModels ?? []));
    } on Failure catch (failure) {
      emit(PostfetchapiError(failure: failure));
    } catch (e) {
      print(e.toString());
    }
  }
}
