import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/list_post_cubit.dart';
import 'package:pattern_bloc/models/pattern_model.dart';

import '../bloc/update_post_cubit.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context, TextEditingController titleController, TextEditingController bodyController, TextEditingController nameController, String userId){
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
                PatternApi post = PatternApi(name: nameController.text, title: titleController.text, body: bodyController.text, dateTime: DateTime.now().toString().substring(0, 16), id: userId);
                BlocProvider.of<UpdatePostCubit>(context).updatePost(post);
              },
              color: Colors.blueGrey,
              child: const Text(
                "Edit", style: TextStyle(color: Colors.white),
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