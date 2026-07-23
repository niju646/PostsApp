import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/router_constants.dart';
import 'package:flutter_app/features/posts/data/models/post_model.dart';
import 'package:go_router/go_router.dart';

class PostDetailScreen extends StatelessWidget {
  final PostModel posts;
  const PostDetailScreen({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(RouterConstants.editPostScreen, extra: posts);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              posts.title ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(posts.body ?? ""),
          ],
        ),
      ),
    );
  }
}
