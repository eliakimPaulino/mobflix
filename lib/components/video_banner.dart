import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoBanner extends StatefulWidget {
  const VideoBanner({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  @override
  State<VideoBanner> createState() => _VideoBannerState();
}

class _VideoBannerState extends State<VideoBanner> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url =
        // 'https://www.youtube.com/watch?v=94yuIVdoevc&ab_channel=AluraCursosOnline';
    // 'https://www.youtube.com/watch?v=vfR8GWj28To&ab_channel=AluraCursosOnline';
    'https://youtu.be/2t8ycK8D4Rk';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        hideControls: true,
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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => SizedBox(
        height: 238,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: player,
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2.5,
              bottom: 5,
              child: SizedBox(
                height: 30,
                width: 120,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    },
                    child: controller.value.isPlaying
                        ? const Icon(Icons.pause)
                        : const Text('Assista agora'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
