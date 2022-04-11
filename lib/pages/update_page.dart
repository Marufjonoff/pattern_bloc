import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/list_post_cubit.dart';
import 'package:pattern_bloc/bloc/update_post_cubit.dart';
import 'package:pattern_bloc/bloc/update_post_state.dart';
import 'package:pattern_bloc/models/pattern_model.dart';
import 'package:pattern_bloc/views/view_update_post.dart';

class UpdatePage extends StatefulWidget {

  PatternApi patternApi;
  UpdatePage({required this.patternApi});

  static const String id = "/update_page";
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  late String id;

  _finish(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.patternApi.name;
    titleController.text = widget.patternApi.title;
    bodyController.text = widget.patternApi.body;
    id = widget.patternApi.id;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePostCubit(),
      child: BlocProvider(
        create: (context) => ListPostCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Update post"),
          ),
          body: BlocBuilder<UpdatePostCubit, UpdatePostState>(
            builder: (BuildContext context, UpdatePostState state) {
              if (state is UpdatePostLoading) {
              return viewOfUpdate(true, context, nameController, titleController, bodyController, id);}

              if (state is UpdatePostLoaded) {_finish(context);}

              if (state is UpdatePostError) {}

              return viewOfUpdate(false, context, nameController, titleController, bodyController, id);},
          ),
        ),
      ),
    );
  }
}
