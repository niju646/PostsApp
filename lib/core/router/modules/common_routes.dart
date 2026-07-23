import 'package:flutter_app/core/constants/router_constants.dart';
import 'package:flutter_app/features/posts/data/models/post_model.dart';
import 'package:flutter_app/features/posts/presentation/screens/create_post_screen.dart';
import 'package:flutter_app/features/posts/presentation/screens/edit_post_screen.dart';
import 'package:flutter_app/features/posts/presentation/screens/post_screen.dart';
import 'package:flutter_app/features/posts/presentation/screens/post_detail_screen.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> commonRoutes = [
  GoRoute(
    path: '/',
    name: RouterConstants.home,
    builder: (context, state) => const PostScreen(),
  ),
  GoRoute(
    path: '/createPosts',
    name: RouterConstants.createPosts,
    builder: (context, state) => const CreatePostScreen(),
  ),
  GoRoute(
    path: '/postDetailScreen',
    name: RouterConstants.postDetailScreen,
    builder: (context, state) {
      final posts = state.extra as PostModel;
      return PostDetailScreen(posts: posts);
    },
  ),
  GoRoute(
    path: '/editPostScreen',
    name: RouterConstants.editPostScreen,
    builder: (context, state) {
      return EditPostScreen();
    },
  ),
];
