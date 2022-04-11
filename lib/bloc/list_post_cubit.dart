import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/list_post_state.dart';
import 'package:pattern_bloc/models/pattern_model.dart';
import 'package:pattern_bloc/pages/detail_page.dart';
import 'package:pattern_bloc/pages/update_page.dart';
import 'package:pattern_bloc/service/http_service.dart';

class ListPostCubit extends Cubit<ListPostState> {
    ListPostCubit():super(ListPostInit());

    // get
    void apiGet() async {
      emit(ListPostLoading());

      var response = await HttpService.GET(HttpService.API_USERS, HttpService.paramEmpty());

      if(response != null) {
        emit(ListPostLoaded(posts: HttpService.parsePatternApi(response)));
      } else {
        emit(ListPostError(error: "Couldn't fetch posts"));
      }

    }

    void callCreatePage(BuildContext context) async {
      var result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const DetailPage())
      );

      if(result != null) {
        apiGet();
      }
    }

    void callUpdatePage(BuildContext context, PatternApi patternApi) async {
      var result = await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => UpdatePage(patternApi: patternApi))
      );
      if (result != null){
        apiGet();
    }
  }

    // api delete
    void apiDelete(String userId) async {
      emit(ListPostLoading());

      final response = await HttpService.DELETE(HttpService.apiDelete(userId), HttpService.paramEmpty());
      print(response);
      if(response != null) {
        apiGet();
      } else {
        emit(ListPostError(error: "Couldn't delete post"));
      }
    }

}