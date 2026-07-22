part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class FetchPosts extends PostsEvent {}

class CreatePosts extends PostsEvent {
  final String title;
  final String body;

  CreatePosts({required this.title, required this.body});
}

class DeletePosts extends PostsEvent {
  final int id;
  DeletePosts({required this.id});
}
