import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/create_post_cubit.dart';
import 'package:pattern_bloc/bloc/list_create_state.dart';

import '../views/view_of_create.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const String id = "/detail_page";
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Post"),
        ),

        body: BlocBuilder<CreatePostCubit, CreatePostSate>(
          builder: (BuildContext context, CreatePostSate state) {
            if(state is CreatePostLoading){
              return viewOfCreate(true,context,titleController,bodyController, nameController);
            }
            if(state is CreatePostLoaded){
              _finish(context);
            }
            if(state is CreatePostError){

            }
            return viewOfCreate(false,context,titleController,bodyController, nameController);
          },
        ),
      )
    );
  }
}

