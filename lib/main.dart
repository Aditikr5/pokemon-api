

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project/screens/first_screen.dart';
import 'package:project/services/api.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'config/config.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
//import 'lib/models/pokemon_list.dart';
//import 'lib/services/api.dart';
import 'models/pokemon_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    
        
     home: MyHomePage(),
    );
    
}
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    Pokemon pokemon = Pokemon();
    bool loading = false;
    List<Color> colorData =[Colors.amber, Colors.blueAccent, Colors.red, Colors.green,Colors.amber, Colors.blueAccent, Colors.red, Colors.green,Colors.purple, Colors.blueAccent, Colors.red, Colors.green ,Colors.amber, Colors.blueAccent, Colors.red, Colors.green ,Colors.purple, Colors.amber, Colors.red, Colors.blueAccent  ];
    @override
    void initState(){
      super. initState();
      getData();
    }
    getData() async{
      loading = false;
      pokemon = Pokemon.fromJson(await Api.getRequest(config['BASE_URL']));
      setState(() {
        loading = true;
      });
      print(pokemon.results[0].name);
    }
/*_launchURL(url) async {
    //const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
}*/
  
     


  @override
  Widget build(BuildContext context) {
    print(colorData.length);
    return Scaffold(
      /*appBar: AppBar(
        title: Text("POKEMON"),
        backgroundColor: Colors.amber,
      ),*/
      body: Center(
        child:loading? InkWell(
          child: Container(
            decoration: BoxDecoration(
              //image: DecorationImage(
                //image: NetworkImage("https://i.pinimg.com/originals/92/27/09/922709a45c8402be61ac9c0b54429c32.png"),fit: BoxFit.cover,
                //),
              gradient: LinearGradient(
                 begin: Alignment.topRight,
                 end:  Alignment.bottomLeft,
                 stops: [0.1, 0.5, 0.7,0.9],
                 colors: [
                   Colors.grey[900],
                   Colors.grey[800],
                   Colors.grey[700],
                   Colors.grey[600],
                 ],
               ),
              border: Border(
                top: BorderSide(width: 1),
                bottom: BorderSide(width: 1),
            ),
          ),
          
            
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pokemon.results.length,
            itemBuilder: (BuildContext context, int index){
                print(pokemon.results.length);
              return InkWell(
                onTap: (){
                 //_launchURL(pokemon.results[index].url);
                  Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) => FirstScreen(pokemonName : pokemon.results[index].name,index: index,colorData:colorData) ));
                },
                
                
                 child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    /*Center(
                      child: 
                    SizedBox(
                      width: 200,
                      child: FadeAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                       },
                       text: [
                           "  CHOOSE",
                           "  YOUR",
                           "POKEMON!!!"
                          ],
                        textStyle: TextStyle(
                          color: Colors.amber,
                        fontSize: 32.0, 
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),),*/
                    
                    
                    Card(
                      shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(700.0)
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                     child: Container(
                       width: 300,
                       height: 300,
                       //color: Colors.black12,
                       decoration: BoxDecoration(
                         shape: BoxShape.rectangle,
                         color: colorData[index],
                         borderRadius: BorderRadius.circular(1000),
                         boxShadow: <BoxShadow>[
                           BoxShadow(
                             color: Colors.black12,
                             blurRadius: 100,
                             offset: Offset(20.0,50.0),
                           )
                         ],
                //          gradient: LinearGradient(
                //            begin: Alignment.topRight,
                //                 end:  Alignment.bottomLeft,
                //                 stops: [0.1, 0.5, 0.7,0.9],
                //                 colors: [
                //                 Colors.amber[800],
                //                 Colors.amber[800],
                //                 Colors.amber[900],
                //                 Colors.amber[900],
                // ],
                //          )
                       ),
                       child:Center(
                         child: Text(pokemon.results[index].name.toUpperCase(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                       ),
                       ),
                    ),
                    
                  ],
                ),
                
              );
            },
          ),
          
        )): Center( child: CircularProgressIndicator(backgroundColor: Colors.redAccent[100])),
      ),
    );   
  }

}
