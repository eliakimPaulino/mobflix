// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class CardPresentation extends StatefulWidget {
  const CardPresentation({
    Key? key,
    // required this.context,
    required this.url,
    required this.categoryContainer,
  }) : super(key: key);
  
  final String url;
  final Widget categoryContainer;

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: controller),
        builder: (context, player) => Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
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
                    top: 6,
                    left: 0,
                    child: widget.categoryContainer,
                  ),
                ],
              ),
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
