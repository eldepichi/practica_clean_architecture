import 'package:seccion7_videoapp/domain/entities/video_post.dart';
import 'package:seccion7_videoapp/domain/datasources/video_post_datasourse.dart';
import 'package:seccion7_videoapp/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDataSource videosDatasource;

  VideoPostsRepositoryImpl({
    required this.videosDatasource,
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
