import 'package:apifetchwithcubit/core/repository/api_repository.dart';
import 'package:apifetchwithcubit/cubit/post_cubit/postfetchapi_cubit.dart';
import 'package:apifetchwithcubit/screens/my_home_page.dart';
import 'package:apifetchwithcubit/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostfetchapiCubit>(
          create: (context) => PostfetchapiCubit(
            apiRepository: ApiRepository(
              api_service: apiService,
            ),
          )..postfetchApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
