// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';


class SecondScreen extends StatefulWidget {
  
  const SecondScreen({super.key, required this.receta,required this.img, required this.fav});

  final String receta;
  final String img;
  final bool fav;
  @override
  State<SecondScreen> createState() => _SecondScreenState(img: img, receta:receta, fav:fav);

}
class _SecondScreenState extends State<SecondScreen>{
  _SecondScreenState({required this.img, required this.receta, required this.fav});

  bool fav;
  List<String> ingredientes = [];
  List<String> pasos = [];
  String img;
  String receta;

  @override
  Widget build(BuildContext context) {


    if(receta == "Pork & Chive Dumplings"){
      ingredientes = ["200g pork mince","1 egg", 
      "3 tbsp chicken stock", "1 tsp sea salt", "garlic chives", "20 gyoza wrappers"];

      pasos = ["1.Mix the ingredients together","2.Place filling in wrappers","3.Boil until cooked through"];

    }else if(receta == "Japanese Chicken Curry"){
      ingredientes = ["500g chicken thighs","steamed rice", "2 tbsp curry powder", "2 tsp garam masala", 
      "50g unsalted butter", "1 onion", "1 carrot", "2 peeled potatoes ", "2 garlic cloves",
      "3/4 cup apple juice", "1/4 cup soy sauce", "chilli powder to taste", "sea salt to taste"];

      pasos = ["1.Heat the butter and garam masala for 3 minutes", "2.Add garlic and onion and stir 3 minutes",
      "3.Add soy sauce, apple juice, curry, chicken and stir",
      "4.Add vegetables and bring the curry to a simmer",
      "5.Turn the heat to low and wait 45 minutes",
      "6.Serve with rice"];
    
    }else if(receta =="Garlic Prawn Udon"){
      ingredientes = ["200g prawns","400g udon noodles", 
      "4 garlic cloves", "3 tbsp oytser sauce", "1 tbsp soy sauce", "1/cup spring onion"];

      pasos = ["1.Boil the udon noodles","2.Heat oil in a pan and add sauces, stir for a minute",
      "3.Add garlic and prawns, stir until cooked", "4. Add noodles and fry for another minute"];

    }else if(receta =="Fried Rice with Pork"){
      ingredientes = ["4x 150g pork steaks","200g asian greens", 
      "2 tbsp soy sauce", "1/2 cup char siu sauce", "1 onion", "4 garlic cloves",
      "3 cups cooked jasmine rice", "2 eggs lightly beaten"];

      pasos = ["1. Cook pork steaks in a pan with the char siu","2.Combine sauces in a small bowl",
      "3.Heat up oil and add the garlic, onion and greens", "4. Add rice, the eggs and toss until everything is coated"];
    }

    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context,fav),
        ),
        title: Center(child: Text(receta, style: TextStyle(color: Colors.white))),
        actions: <Widget>[
            IconButton(
              icon: Icon(fav?Icons.star:Icons.star_border, color: Colors.white,), // Replace with your desired icon
              onPressed: () {
                setState((){
                  fav = !fav;
                  SnackBar snackBar;
                  if(fav){
                    snackBar = SnackBar(
                      content: const Text('Receta agregada a favoritos'),
                    );
                  }else{
                    snackBar = SnackBar(
                      content: const Text('Receta eliminada de favoritos'),
                    );
                  }
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }); 
              },
             
            )
        ]
      ),
      backgroundColor: Color.fromARGB(255, 211, 231, 243),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  img, 
                  height: MediaQuery.of(context).size.height/2.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                child: Text("Ingredients",
                  style:TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color:const Color.fromARGB(255, 42, 63, 74))
                ),
              ),
              Column(
                children: ingredientes.map((e) => Text(e)).toList(),
              ),

              Padding(
                padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                child: Text("Steps",
                  style:TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color:const Color.fromARGB(255, 42, 63, 74))
                ),
              ),
              Column(
                children: pasos.map((e) => Text(e)).toList(),
              )
            ]   
          )
        ),
      ),
    );

  }
}