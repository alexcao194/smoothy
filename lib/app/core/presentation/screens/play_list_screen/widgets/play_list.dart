import 'package:flutter/material.dart';
import 'package:smoothy/config/app_colors.dart';

class PlayList extends StatelessWidget {
  const PlayList({Key? key}) : super(key: key);

  // TODO : remove this list
  final data = const [
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    },
    {
      "name" : "Sao củng được",
      "author" : "Binz",
      "cover" : "https://cdn.discordapp.com/attachments/960780341952544798/1061565268788264960/image.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Playlist',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50.0,
                            child: Image.network(data[index]["cover"]!)
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index]["name"]!,
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white
                                ),
                              ),
                              Text(data[index]["author"]!,
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
