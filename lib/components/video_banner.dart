import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoBanner extends StatefulWidget {
  const VideoBanner({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoBanner> createState() => _VideoBannerState();
}

class _VideoBannerState extends State<VideoBanner> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url = 'https://youtu.be/2t8ycK8D4Rk';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        loop: true,
        autoPlay: false,
        hideControls: true,
        showLiveFullscreenButton: false,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => SizedBox(
        height: 238,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: player,
        ),
      ),
    );
  }
}
