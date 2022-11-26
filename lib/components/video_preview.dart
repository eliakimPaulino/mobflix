// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class VideoPreview extends StatefulWidget {
  const VideoPreview({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  Map<String, PreviewData> datas = {};

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color(0xfff7f7f8),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: LinkPreview(
                onPreviewDataFetched: (data) {
                  setState(() {
                    datas = {
                      ...datas,
                      widget.url: data,
                    };
                  });
                },
                previewData: datas[widget.url],
                text: widget.url,
                width: screenSize.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}