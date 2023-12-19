import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/inicial.dart';
import 'package:hello/services/musics.dart';
import 'package:hello/widgets/util/format.dart';

import 'widgets/music_info.dart';

class MusicTocar extends StatefulWidget {
  final Musica musicaData;
  const MusicTocar({super.key, required this.musicaData});

  @override
  State<MusicTocar> createState() => _MusicTocarState();
}

class _MusicTocarState extends State<MusicTocar> {
  bool isPlaying = false;
   double volume = 1.0;
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duracao = const  Duration();
  Duration _posicao = const Duration();

 @override
 void initState(){
    initPlayer();
    super.initState();
 }
  
 @override
 void dispose(){
    player.dispose();
    super.dispose();
 }


 Future initPlayer () async {
  player = AudioPlayer();
  

  player.onDurationChanged.listen((Duration d) {
    print(d);
       if (mounted) {
    setState(() {
      _duracao = d;
    });
  }
    });
   player.onPositionChanged.listen((Duration p){
    
     if (mounted) {
    setState(() {
      _posicao = p;
    });
  }
       
       
       }
         
  );
player.onPlayerComplete.listen((_) {
if (mounted) {
    setState(() {
      _posicao = _duracao;
    });
  }
});

   
 }

   Future playPause() async {
   String audioUrl = widget.musicaData.audioUrl;
   print('MUSICA: $audioUrl');
     if(isPlaying){
      player.pause();
      isPlaying=false; 
    
    }else{
    
    isPlaying= true;
    await player.play(UrlSource(audioUrl));
    }


   
    setState(() { });
  }
   Future<void> setVolume(double vol) async {
    await player.setVolume(vol);
    setState(() {
      volume = vol;
    });
  }

 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(
       backgroundColor:  AppColors.primaryColor,
      


       leading: IconButton(
                                          icon: const Icon(
                                           Icons.arrow_back,
                                            size: 30,
                                            color: Colors.white,
                                                                            ), 
                                                                            
                                          onPressed: () {  Navigator.of(context).pop();
                                          
                        },
                                        ),
       
      ),
        backgroundColor: AppColors.primaryColor,


        body: 
        
       SingleChildScrollView(
        scrollDirection:Axis.vertical,
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(18.0),
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    MusicInfo(musicaData: widget.musicaData),
                    const SizedBox(height: 50,),
                    Slider(
                      value:_posicao.inSeconds.toDouble(),
                   
                    
                    onChanged: (value) async{
                      await player.seek(Duration(seconds: value.toInt()));
                       setState(() { } );
                       
                    },
                     min:0,
                    max: _duracao.inSeconds.toDouble(),
                    inactiveColor:Colors.grey,
                    activeColor:AppColors.secondaryColor,
                    
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                    
                           Text(_posicao.format()),
              
              
                    ],),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       InkWell(
                          onTap: (){
                            player.seek(Duration(seconds: _posicao.inSeconds-10));
                            setState(() {});
                          },
                          child: Image.asset('assets/icons/end.png'),
                       ),
                      const SizedBox(width: 20,),
                        InkWell(
                             onTap: playPause,
                            child:Icon(
                            isPlaying ? Icons.pause_circle :Icons.play_circle,
                            color :Colors.white,
                           size: 100,
                             ),
                           ),
              
                  const SizedBox(width: 20,),
                    InkWell(
                          onTap: (){
                            player.seek(Duration(seconds: _posicao.inSeconds+10));
                            setState(() {});
                          },
                          child: Image.asset('assets/icons/back.png'),
                       )
                    ],),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setVolume(volume - 0.1 > 0.0 ? volume - 0.1 : 0.0);
                        },
                        icon: Icon(Icons.volume_down),
                      ),
                      Slider(
                        value: volume,
                        onChanged: (value) {
                          setVolume(value);
                        },
                        min: 0.0,
                        max: 1.0,
                        divisions: 10,
                        label: '$volume',
                      ),
                      IconButton(
                        onPressed: () {
                          setVolume(volume + 0.1 < 1.0 ? volume + 0.1 : 1.0);
                        },
                        icon: Icon(Icons.volume_up),
                      ),
                    ],
                  ),
                ],
              
                ),
              
              
              ),
            ],
          ),
        ),



    );
  }


}