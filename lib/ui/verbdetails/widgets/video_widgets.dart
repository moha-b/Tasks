import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String id;
  const VideoWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  bool _videoFinished = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.id)
      ..initialize().then((_) {
        setState(() {}); // Refresh the state once the video is initialized
      });

    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        setState(() {
          _videoFinished = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller when the widget is disposed
  }

  void togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
        _videoFinished = false; // Reset the video finished flag
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showControls =
              !_showControls; // Toggle visibility of controls on tap
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
          Visibility(
            visible: _showControls,
            child: IconButton(
              icon: Icon(
                _controller.value.isPlaying && !_videoFinished
                    ? Icons.pause
                    : Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
              onPressed: togglePlayPause,
            ),
          ),
        ],
      ),
    );
  }
}
