import 'package:flutter/material.dart';
import 'package:smoothy/config/app_colors.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {

  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: AppColors.track,
        inactiveTrackColor: AppColors.inActiveTrack,
        trackHeight: 2.0,
        overlayShape: SliderComponentShape.noOverlay,
        thumbShape: SliderComponentShape.noThumb,
      ),
      child: Slider(
          value: progress,
          onChanged: (value) {
            setState(() {
              progress = value;
            });
          }),
    );
  }
}