import 'package:flutter/material.dart';
import 'info_lugar.dart';
import 'item_actividad.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/main_img.jpg'),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top:MediaQuery.of(context).size.height/5,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          int diaNum = index+1;
                          List<String> images = ["assets/bali_mountain.jpg", "assets/bali_beach.jpg", "assets/bali_forest.jpg", 
                            "assets/bali_museum.jpg","assets/bali_temple.jpg"];
                          List<String> places = ["Bali Mountain", "Bali Beach", "Bali Forest", "Bali Museum", "Bali Temple"];
                          return ItemActividad( day: 'Day $diaNum', place: places[index], img: images[index]);
                        },
                      ),
                    ),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: MaterialButton(
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: const Text('Reservación en progreso'),
                            );
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                            child: Text("Start booking", style: TextStyle(color: Colors.white),),
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
            ],
          );
        },
      ),
    );
  }
}
