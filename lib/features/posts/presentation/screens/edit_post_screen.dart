import 'package:flutter/material.dart';
import 'package:flutter_app/features/posts/data/models/post_model.dart';
import 'package:flutter_app/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPostScreen extends StatefulWidget {
  final PostModel? posts;
  const EditPostScreen({super.key, this.posts});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(controller: titleController),
            TextFormField(controller: bodyController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<PostsBloc>().add(
                  UpdatePosts(
                    title: titleController.text.trim(),
                    body: bodyController.text.trim(),
                    id: widget.posts?.id ?? 0,
                  ),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Post Updated')));
              },
              child: const Text('Update Post'),
            ),
          ],
        ),
      ),
    );
  }
}
