import 'package:equatable/equatable.dart';

class CreatePostSate extends Equatable {

  @override
  List<Object> get props => [];
}

class CreatePostInit extends CreatePostSate {}

class CreatePostLoading extends CreatePostSate {}

class CreatePostLoaded extends CreatePostSate {
  final bool? isCreated;

  CreatePostLoaded({this.isCreated});
}

class CreatePostError extends CreatePostSate {
  final error;

  CreatePostError({this.error});
}