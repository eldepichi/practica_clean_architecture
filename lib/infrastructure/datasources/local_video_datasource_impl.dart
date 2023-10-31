import 'package:seccion7_videoapp/domain/datasources/video_post_datasourse.dart';
import 'package:seccion7_videoapp/domain/entities/video_post.dart';
import 'package:seccion7_videoapp/infrastructure/models/local_video_model.dart';
import 'package:seccion7_videoapp/shared/data/local_video_post.dart';

class LocalVideosDatasourse implements VideoPostDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    //await Future.delayed(const Duration(milliseconds: 2000));
    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
