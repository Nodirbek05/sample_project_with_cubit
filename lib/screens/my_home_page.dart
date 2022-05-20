import 'package:apifetchwithcubit/core/models/post_models.dart';
import 'package:apifetchwithcubit/cubit/post_cubit/postfetchapi_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api fetch with Cubuit'),
      ),
      body: BlocBuilder<PostfetchapiCubit, PostfetchapiState>(
        builder: ((context, state) {
          if (state is PostfetchapiLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is PostfetchapiError) {
            return Center(
              child: Text(state.failure.message),
            );
          } else if (state is PostfetchapiLoaded) {
            final postList = state.postModels;
            return postList.isEmpty
                ? const Center(child: Text("There is not any post"))
                : ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      final PostModels singlePost = postList[index];
                      return ListTile(
                        title: Text(
                          "${singlePost.title}",
                        ),
                        subtitle: Text(
                          "${singlePost.body}",
                        ),
                      );
                    },
                  );
          }
          return SizedBox.shrink();
        }),
      ),
    );
  }
}
