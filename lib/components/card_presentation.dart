// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'horizontal_categorys.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class CardPresentation extends StatefulWidget {
  const CardPresentation(
      {Key? key,
      required this.context,
      required this.url,
      required this.name,
      required this.color})
      : super(key: key);
  final BuildContext context;
  final String url;
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

  Map<String, PreviewData> datas = {};

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Card(
        surfaceTintColor: Colors.blue,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Visibility(
                  visible: true,
                  child: AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: player,
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    child: Categorys(name: widget.name, color: widget.color)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      LinkPreview(
                        hideImage: true,
                        onPreviewDataFetched: (data) {
                          setState(() {
                            datas = {
                              ...datas,
                              widget.url: data,
                            };
                          });
                        },
                        text: widget.url,
                        previewData: datas[widget.url],
                        width: MediaQuery.of(context).size.width,
                      ),
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
