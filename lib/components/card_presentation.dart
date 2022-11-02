import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'horizontal_categorys.dart';

class CardPresentation extends StatefulWidget {
  const CardPresentation(
      {Key? key,
      required this.context,
      required this.url,
      required this.videoTitle, required this.name, required this.color})
      : super(key: key);
  final BuildContext context;
  final String url;
  final String videoTitle;
  final String name;
  final Color color;

  @override
  State<CardPresentation> createState() => _CardPresentationState();
}

class _CardPresentationState extends State<CardPresentation> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    var url = widget.url.toString();

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        hideControls: false,
        enableCaption: false,
      ),
    );
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
      builder: (context, player) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: player,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          widget.videoTitle,
                          style: const TextStyle(
                              color: Color.fromRGBO(12, 67, 136, 1),
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Categorys(name: widget.name, color: widget.color),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
