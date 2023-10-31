import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seccion7_videoapp/config/theme/app_theme.dart';
import 'package:seccion7_videoapp/presentation/providers/discover_provider.dart';
import 'package:seccion7_videoapp/presentation/screens/discover/discover_screen.dart';
import 'package:seccion7_videoapp/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:seccion7_videoapp/infrastructure/repositories/video_posts_repository_impl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(
      videosDatasource: LocalVideosDatasourse(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(
            videosRepository: videoPostRepository,
          )..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
