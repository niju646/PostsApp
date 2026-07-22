import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/posts/data/models/post_model.dart';
import 'package:flutter_app/features/posts/data/services/post_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<FetchPosts>(_fetchPosts);
    on<CreatePosts>(_createPosts);
    on<DeletePosts>(_deletePosts);
  }

  Future<void> _fetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoadingState());
    final response = await PostService().getPosts();
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final fetched = (data as List)
            .map((e) => PostModel.fromJson(e))
            .toList();
        emit(PostsLoadedState(posts: fetched));
      }
    } catch (e) {
      emit(PostsErrorState(error: e.toString()));
      log(e.toString());
    }
  }

  Future<void> _createPosts(CreatePosts event, Emitter<PostsState> emit) async {
    emit(PostsLoadingState());
    final response = await PostService().createPosts(
      title: event.title,
      body: event.body,
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("posts created");
        add(FetchPosts());
        log(response.data.toString());
      }
    } catch (e) {
      emit(PostsErrorState(error: e.toString()));
      log(e.toString());
    }
  }

  Future<void> _deletePosts(DeletePosts event, Emitter<PostsState> emit) async {
    emit(PostsLoadingState());
    final response = await PostService().deletePosts(id: event.id);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("posts deleted");
        add(FetchPosts());
        log(response.data.toString());
      }
    } catch (e) {
      emit(PostsErrorState(error: e.toString()));
      log(e.toString());
    }
  }
}
