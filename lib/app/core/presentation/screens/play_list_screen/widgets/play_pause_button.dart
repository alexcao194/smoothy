import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> with SingleTickerProviderStateMixin {
  AnimationController? controller;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(controller!.isCompleted) {
          controller!.reverse();
        } else {
          controller!.forward();
        }
        widget.onTap();
      },
      child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          color: Colors.white,
          progress: controller!
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }



}