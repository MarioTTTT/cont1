import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/services/musics.dart';

class MusicInfo extends StatelessWidget {
  final Musica musicaData;

  const MusicInfo({Key? key, required this.musicaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          musicaData.imageUrl,
          width: 250,
        ),
        const SizedBox(height: 30),
        Text(
          musicaData.nome,
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 30),
        Text(
          musicaData.bandaCantor,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textun,
          ),
        ),
      ],
    );
  }
}
