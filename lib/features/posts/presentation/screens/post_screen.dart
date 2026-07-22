import 'package:flutter/material.dart';
import 'package:flutter_app/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:flutter_app/features/posts/presentation/screens/create_post_screen.dart';
import 'package:flutter_app/features/posts/presentation/widgets/custom_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(FetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  if (state is PostsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is PostsLoadedState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return CustomCard(
                          title: post.title ?? "",
                          id: post.id ?? 0,
                          onDelete: () {
                            context.read<PostsBloc>().add(
                              DeletePosts(id: post.id ?? 0),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Post deleted")),
                            );
                          },
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
