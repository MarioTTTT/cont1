import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/widgets/playlist.dart';

class PlayPerfil extends StatelessWidget {
  const PlayPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 72, 141),
        title: const Text('ColdApp'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'PopMusic',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.share_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const PlayCard(),
            const PlayCard(),
            const PlayCard(),
            const PlayCard(),
          ],
        ),
      ),
    );
  }
}