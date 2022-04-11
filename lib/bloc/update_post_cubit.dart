import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/update_post_state.dart';
import 'package:pattern_bloc/models/pattern_model.dart';
import 'package:pattern_bloc/service/http_service.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {

  UpdatePostCubit():super(UpdatePostInit());

  void updatePost(PatternApi post) async{

    emit(UpdatePostLoading());

    final response = await HttpService.PUT(HttpService.apiPatch(post.id), HttpService.paramsCreate(post));
    if (response != null) {
      emit(UpdatePostLoaded(isUpdate: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }

}