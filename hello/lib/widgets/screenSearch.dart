import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/widgets/model_Music.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static List< MusicModel> mainmusiclist =[
      MusicModel('Yourself', 2005, "https://static.stereogum.com/uploads/2022/10/Eminem-Lose-Yourself-1666109360-520x5201-1666540295.jpeg",'Eminem'),
      MusicModel('bring me to life', 2003, "https://akamai.sscdn.co/uploadfile/letras/albuns/c/e/0/6/874991585597114.jpg",'Evanesce'),
      MusicModel('In The End', 2000, "https://i1.sndcdn.com/artworks-000386461686-h1f08n-t500x500.jpg",'LinkPark'),
       MusicModel(' Psychosocial', 2008, "https://wikimetalstore.com.br/produtos/imagens/229_1.jpg",'SleepKnot'),
       
  ];

  List<MusicModel> displaylist = List.from(mainmusiclist);

  void updateList(String value){

 void updateList(String value){
    setState(() {
      displaylist = mainmusiclist.where((element) => element.musicatitulo!.toLowerCase().contains(value.toLowerCase())).toList();
    });
 }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
         padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
               Text('Pesquise por uma Musica',
               style: TextStyle(
                color:Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold
                ),
                ),
               SizedBox(height: 20.0),
               
               TextField(
                onChanged: (value)=>updateList(value),
                style:TextStyle(color:Colors.white),
                decoration: InputDecoration(
                filled:true,
                fillColor: AppColors.secondaryColor,
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                   ),
                   hintText: "ex:Youserlf",
                   prefixIcon: Icon(Icons.search) ,
                   prefixIconColor: Colors.white
                ),
               ),
               SizedBox(height: 20.0,),
               Expanded(
                child: displaylist.length ==0 ? Center(child: Text("Resultados não encontrados",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight:FontWeight.bold ),),): ListView.builder(
                itemCount: displaylist.length,
                itemBuilder: (context, index) =>ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title:Text(displaylist[index].musicatitulo!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                  ),
                  ),
                       subtitle: Text('${displaylist[index].banda}',style: TextStyle(color: Colors.white
                       
                       ),
                       ),
                             trailing:Text("${displaylist[index].musicaano}",style:TextStyle(color: Colors.white  
                             ),
                             ),
                              leading:Image.network(displaylist[index].musicaimagem!),
                ),
            
             
                
                )
               ),
           ],
        ),

    );
  }
}