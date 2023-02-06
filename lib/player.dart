import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  List Songs = [
    {
      "id": 1,
      "name": "Adele_Set_Fire_to_the_Rain",
      "thumbnail": "https://i.ytimg.com/vi/9b9lFJ8uf_A/maxresdefault.jpg",
      "path": "songs/Adele_Set_Fire_to_the_Rain.mp3",
      "artist": "Adele",
      "genre": "Romance"
    },
    {
      "id": 2,
      "name": "Adele_Easy_On_Me",
      "thumbnail": "https://i.ytimg.com/vi/9b9lFJ8uf_A/maxresdefault.jpg",
      "path": "songs/Adele_Easy_On_Me.mp3",
      "artist": "Adele",
      "genre": "Romance"
    },
    {
      "id": 3,
      "name": "Adele_Oh_My_God",
      "thumbnail": "https://i.ytimg.com/vi/9b9lFJ8uf_A/maxresdefault.jpg",
      "path": "songs/Adele_Oh_My_God.mp3",
      "artist": "Adele",
      "genre": "Romance"
    },
    {
      "id": 4,
      "name": "Adele_Rooling_In_The_Deep",
      "thumbnail": "https://i.ytimg.com/vi/9b9lFJ8uf_A/maxresdefault.jpg",
      "path": "songs/Adele_Rooling_In_The_Deep.mp3",
      "artist": "Adele",
      "genre": "Romance"
    },
    {
      "id": 5,
      "name": "Adele_Someone_Like_You",
      "thumbnail": "https://i.ytimg.com/vi/9b9lFJ8uf_A/maxresdefault.jpg",
      "path": "songs/Adele_Someone_Like_You.mp3",
      "artist": "Adele",
      "genre": "Romance"
    },
  ];

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state ==
            PlayerState
                .playing; // based on state == PlayerState.playing, isPlaying will be changed
      });
    });

    audioPlayer.onPositionChanged.listen((pos) {
      setState(() {
        position = pos;
      });
    });

    audioPlayer.onDurationChanged.listen((dur) {
      setState(() {
        duration = dur;
      });
    });
  }

  Future setAudio() async {
    await audioPlayer.play(AssetSource(Songs[i]["path"]));
  }

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, int>;
    int? i = routes['index'] as int;
    // var a = routes['index']?.toInt();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
      ),
      body: Container(
        color: const Color.fromARGB(255, 166, 172, 204),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Image.network(Songs[i]["thumbnail"]),
            ),
            // Slider.adaptive(
            //     onChanged: (value) {
            //       setState(() {
            //         value = value;
            //       });
            //     },
            //     min: 0.0,
            //     max: duration.inSeconds.toDouble(),
            //     value: position.inMilliseconds.toDouble()),
            Slider.adaptive(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  setState(() {
                    value = value;
                  });
                  await audioPlayer
                      .seek(Duration(microseconds: (value * 1000).toInt()));
                }),

            CircleAvatar(
              child: IconButton(
                onPressed: () async {
                  if (isPlaying == false) {
                    await audioPlayer.resume();
                    //await audioPlayer.play(AssetSource(Songs[i]["path"]));
                  } else {
                    await audioPlayer.pause();
                  }
                },
                icon: Icon(isPlaying == false
                    ? Icons.play_circle_rounded
                    : Icons.pause),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
