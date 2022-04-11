import 'package:flutter/material.dart';
import 'package:pattern_bloc/models/pattern_model.dart';
import 'package:pattern_bloc/views/payment_view_list.dart';

Widget viewOfHome(List<PatternApi>items, bool isLoading) {
  return isLoading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return itemOfListPayment(items[index], context);
          },
        );
}