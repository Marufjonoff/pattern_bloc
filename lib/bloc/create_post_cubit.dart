import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/list_create_state.dart';
import 'package:pattern_bloc/models/pattern_model.dart';

import '../service/http_service.dart';

class CreatePostCubit extends Cubit<CreatePostSate> {
  CreatePostCubit() : super(CreatePostInit());

  void postCreate(PatternApi patternApi) async {
    print(patternApi.toJson());
    emit(CreatePostLoading());

    final response = await HttpService.POST(HttpService.API_POST, HttpService.paramsCreate(patternApi));
    print(response);

    if(response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}