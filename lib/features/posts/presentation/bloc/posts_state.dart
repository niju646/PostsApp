part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  final List<PostModel> posts;
  PostsLoadedState({required this.posts});
}

class PostsErrorState extends PostsState {
  final String error;
  PostsErrorState({required this.error});
}
