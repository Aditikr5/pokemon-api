import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/config/config.dart';
import 'package:project/models/pokemon.dart';
import 'package:project/models/pokemon_ability.dart';
//import 'package:project/models/pokemon_list.dart';
//import 'package:project/models/pokemon_list.dart';
import 'package:project/services/api.dart';

class FirstScreen extends  StatefulWidget {
  final pokemonName;
  final int index;
  final colorData;

  FirstScreen({this.pokemonName,this.index,this.colorData});
  
@override

_FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
with SingleTickerProviderStateMixin {
  Pokego pokego = Pokego();
  Pokeability pokeability = Pokeability();
  bool pokeloading = false;
  bool errorloading = false;
  @override
  void initState(){
      super. initState();
      getPokego();
      
    }
    getPokego()async{
      try{
      pokeloading = false;
      pokego = Pokego.fromJson(await Api.getRequest(config['BASE_URL']+"${(widget.index)+1}"));
      print(config['BASE_URL']+"${(widget.index)+1}");
      pokeability = Pokeability.fromJson(await Api.getRequest(config['POKE_URL']));
      print(config['POKE_URL']);
      setState(() {
        pokeloading = true;
      });
      
      
      print(pokego.baseExperience);
      print(pokego.name);
      print(pokego.weight);
      print(pokego.moves.length);
      print(pokego.abilities[0].ability.name);
      print(pokeability.effectEntries[0].effect);
      }catch(e){
        print("error => ${e.toString()}");
          setState(() {
      errorloading = true;
    });
      }
    }
   
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.pokemonName}",style: TextStyle(color: Colors.white),),
       backgroundColor: Colors.black,
      
      ),
      body: pokeloading? Center(
        child:InkWell(
       child: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
                 begin: Alignment.topRight,
                 end:  Alignment.bottomLeft,
                 stops: [0.1, 0.5, 0.7,0.9],
                 colors: [
                   Colors.orange[200],
                   Colors.orange[200],
                   Colors.orange[100],
                   Colors.orange[100],
                 ],
               ),
         ),
         child: ListView.builder(
           itemCount: 1,//pokego.abilities.length,
           itemBuilder: (BuildContext context, int index) {
           return InkWell(
             onTap: (){
               print("tap");
             },
             child:Center(
              
             child: Column(

             children: <Widget>[
               Text("Weight-> ${pokego.weight}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
               Text("Moves-> ${pokego.moves.length}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
               Text("Base Experience-> ${pokego.baseExperience}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
               Text("Abilities-> ${pokego.abilities[0].ability.name}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
               
             ],
             ),),
           );
          },
         ),
       ),
      
      )
     ):errorloading ?
      Center(
          child: Container(
            child: 
            Column(
              children: <Widget>[
                Padding(
                  padding:EdgeInsets.all(180),
                ),
                Text("sorry,some api issues....",style: TextStyle(fontSize: 30),),
                Icon(Icons.mood_bad, size: 100,),
              ],
            ),
          ),
      ):Center(child:CircularProgressIndicator()),
   );
  }



}