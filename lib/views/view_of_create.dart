import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/create_post_cubit.dart';

import '../models/pattern_model.dart';


Widget viewOfCreate(bool isLoading, BuildContext context, TextEditingController titleController, TextEditingController bodyController, TextEditingController nameController){
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Body",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                  hintText: "Body",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                  PatternApi patternApi = PatternApi(
                    title: titleController.text.toString(),
                    body: bodyController.text.toString(),
                    dateTime: DateTime.now().toString().substring(0, 16),
                    id: '',
                    name: nameController.text.toString(),);
                  BlocProvider.of<CreatePostCubit>(context)
                      .postCreate(patternApi);
              },
              color: Colors.blueGrey,
              child: const Text(
                "Create",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? const Center(
          child: CircularProgressIndicator(),
        ): const SizedBox.shrink(),
      ],
    ),
  );
}