import 'package:flutter/material.dart';
import 'package:flutter_app/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Posts')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            TextFormField(
              controller: bodyController,
              decoration: InputDecoration(hintText: "Body"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<PostsBloc>().add(
                  CreatePosts(
                    title: titleController.text.trim(),
                    body: bodyController.text.trim(),
                  ),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Post Created")));
                Navigator.pop(context);
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
