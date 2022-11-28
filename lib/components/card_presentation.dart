// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobflix/components/horizontal_categorys.dart';
import 'package:mobflix/data/video_dao.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class CardPresentation extends StatefulWidget {
  const CardPresentation({
    Key? key,
    required this.url,
    required this.index,
  }) : super(key: key);

  final String url;
  final int index;

  @override
  State<CardPresentation> createState() => _CardPresentationState();
}

class _CardPresentationState extends State<CardPresentation> {
  late YoutubePlayerController controller;

  bool alreadySaved = false;

  @override
  void initState() {
    super.initState();
    var url = widget.url.toString();

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        forceHD: true,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: player,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: categorys[widget.index],
                  ),
                ],
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    tooltip: 'Add a Lista',
                    onPressed: () {
                      setState(() {
                        alreadySaved = !alreadySaved;
                      });
                    },
                    icon: Icon(Icons.thumb_up_sharp,
                        color: alreadySaved
                            ? const Color.fromRGBO(12, 67, 136, 1)
                            : Colors.grey),
                  ),
                  IconButton(
                    tooltip: 'Deletar',
                    onPressed: () {
                      VideoDao().delete(widget.url);
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {});
                      });
                    },
                    icon: const Icon(Icons.delete_forever_rounded,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
