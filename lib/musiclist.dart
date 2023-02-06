import 'package:flutter/material.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  // ignore: non_constant_identifier_names
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music List"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: Songs.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      Songs[index]["thumbnail"],
                      width: 110,
                    ),
                    Column(
                      children: [
                        Text(
                          Songs[index]["name"],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        Text(Songs[index]["artist"]),
                      ],
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/player",
                              arguments: {'index': index});
                        },
                        icon: const Icon(Icons.play_arrow),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
