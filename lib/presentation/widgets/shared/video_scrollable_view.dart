import 'package:flutter/material.dart';
import 'package:seccion7_videoapp/domain/entities/video_post.dart';
import 'package:seccion7_videoapp/presentation/widgets/shared/video_buttoms.dart';
import 'package:seccion7_videoapp/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, i) {
        final videoPost = videos[i];
        return Stack(
          children: [
            // Video player + Gradiente
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: videoPost.videoURL,
                caption: videoPost.caption,
              ),
            ),

            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            )
          ],
        );
      },
    );
  }
}
