import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notas_share/bloc/master_bloc.dart';
import 'package:notas_share/note_form_page.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: BlocConsumer<MasterBloc, MasterState>(
        listener: (context, state) {
          if (state is RetrievedNotesErrorState) {
            print("HomeError: ${state.errorMsg}");
          }
        },
        builder: (context, state) {
          return _showContent(
            BlocProvider.of<MasterBloc>(context).getNotesList,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NoteFormPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _showContent(List<dynamic> notesList) {
    return ListView.builder(
      itemCount: notesList.length,
      itemBuilder: (BuildContext context, int index) {
            print(notesList[index]["path"]);
      return 
        Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                //DELETE
                BlocProvider.of<MasterBloc>(context).add(DeleteNoteEvent(index));
                
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            
            ),
            SlidableAction( 
              onPressed: (context) 
                //SHARE
                async {
                  await Share.shareXFiles([XFile("${notesList[index]["path"]}")], text: 'Share image');
                },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.share,
            ),
            
          ],),
          child: ListTile(
            leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(child:
                  notesList[index]["path"] == null
                  ? Image.asset('images/noimage.jpg')
                  : Image.file( //Cambio 1
                      File("${notesList[index]["path"]}"), //Cambio 2 
                      fit: BoxFit.cover, //Descomentar
                    ),
               ),
            ),
            title: Text("${notesList[index]["note"]}"),
            onLongPress: () async {
              await Share.share(
                "Tengo una nota para ti: ${notesList[index]["note"]}",
              );
            },
            //Agregar la funcionalidad de compartir utilizamos... share_plus y On Long Press
          ),
        );
      },
    );
  }
}
