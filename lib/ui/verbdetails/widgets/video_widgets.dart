import 'package:apivideo_player/apivideo_player.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatefulWidget {
  final String id;
  const VideoWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late final ApiVideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Instantiate the controller with the provided video id
    _controller = ApiVideoPlayerController(
      videoOptions: VideoOptions(videoId: widget.id),
    );

    // Initialize the controller
    _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed from the tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ApiVideoPlayer(
        controller: _controller,
      ),
    );
  }
}
