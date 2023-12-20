import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/playmusic.dart';
import 'package:hello/services/musics.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 36, 72, 141),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textun,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70),
              child: IconButton(
                icon: const Icon(
                  Icons.play_circle,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final musicID = await MusicaService()
                      .buscarIdMusicaPorNome(widget.title);
                  final musicData = await MusicaService()
                      .getMusicaById(musicID as String);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MusicTocar(
                      musicaData: musicData,
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
