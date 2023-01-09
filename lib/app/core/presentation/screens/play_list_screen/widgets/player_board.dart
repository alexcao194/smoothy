import 'package:flutter/material.dart';
import 'package:smoothy/app/core/presentation/screens/play_list_screen/widgets/play_pause_button.dart';
import 'package:smoothy/config/app_colors.dart';

class PlayerBoard extends StatelessWidget {
  const PlayerBoard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: size.height * 0.1,
                width: size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.network('https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png'),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Kẻ Cắp Gặp Bà Già',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white
                ),
              ),
              Text('Hoàng Thùy Linh',
                style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 4.0),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.track,
                  inactiveTrackColor: AppColors.inActiveTrack,
                  trackHeight: 2.0,
                  overlayShape: SliderComponentShape.noOverlay,
                  thumbShape: SliderComponentShape.noThumb,
                  ),
                child: Slider(
                  value: 0.24,
                  onChanged: (value) {
                    // TODO: implement Slider
                  }

                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {}
                      , icon: const Icon(Icons.shuffle, color: Colors.white)
                  ),
                  IconButton(
                      onPressed: () {}
                      , icon: const Icon(Icons.skip_previous, color: Colors.white)
                  ),
                  PlayPauseButton(onTap: () {}),
                  IconButton(
                      onPressed: () {}
                      , icon: const Icon(Icons.skip_next, color: Colors.white)
                  ),
                  IconButton(
                      onPressed: () {}
                      , icon: const Icon(Icons.download, color: Colors.white)
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}