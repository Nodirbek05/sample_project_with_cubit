part of 'postfetchapi_cubit.dart';

@immutable
abstract class PostfetchapiState {
  List<Object> get props => [];
}

class PostfetchapiInitial extends PostfetchapiState {}

class PostfetchapiLoading extends PostfetchapiState {}

class PostfetchapiLoaded extends PostfetchapiState {
  final List<PostModels> postModels;

  PostfetchapiLoaded({
    required this.postModels,
  });

  @override
  // TODO: implement props
  List<Object> get props => [postModels];
}

class PostfetchapiError extends PostfetchapiState {
  final Failure failure;

  PostfetchapiError({
    required this.failure,
  });

  @override
  // TODO: implement props
  List<Object> get props => [failure];
}
