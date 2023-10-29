import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

part 'master_event.dart';
part 'master_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  List<dynamic> _notesList = [];
  List<dynamic> get getNotesList => _notesList;
  TextEditingController _notesController = TextEditingController();
  TextEditingController get getNotesController => _notesController;
  File? _chosenImage;

  MasterBloc() : super(MasterInitial()) {
    on<GetStoredNotesEvent>(_onGetStoredNotesEvent);
    on<SaveNoteToStorageEvent>(_onSaveNoteToStorageEvent);
    on<ClearNotesFormEvent>(_onClearNotesFormEvent);
    on<ChangeImageEvent>(_onChangeImageEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);
  }
  // Event handlers
  FutureOr<void> _onGetStoredNotesEvent(
    GetStoredNotesEvent event,
    Emitter emit,
  ) async {
    try {
      emit(RetrievedNotesProcessingState());
      //TODO: get stored data
      var _notesBox = await Hive.openBox<dynamic>("notes"); //Crear box para inicializar donde guardar
      _notesList = _notesBox.values.first;
      emit(RetrievedNotesState(notesList: _notesList));
    } catch (e) {
      emit(
        RetrievedNotesErrorState(
          errorMsg: "No se encontraron notas guardadas...",
        ),
      );
    }
  }

  FutureOr<void> _onSaveNoteToStorageEvent(
    SaveNoteToStorageEvent event,
    Emitter emit,
  ) async {
    if(_notesController.text.trim() == ''){
      emit(
        FormSavedErrorState(
            errorMsg: "No hay descripción de la nota"),
      );
    }
    else{
      try {
        emit(RetrievedNotesProcessingState());
        // TODO: save notes to storage
        var _notesBox = await Hive.openBox<dynamic>("notes");
        //Decirle donde esta guardada la imagen y la nota que se escribe. 

        if(_chosenImage == null){
          _notesList.add({
            "path": null,
            "note": "${_notesController.text}",
          });
        }
        else{
          _notesList.add({
            "path": "${_chosenImage!.path}",
            "note": "${_notesController.text}",
          });
        }

        await _notesBox.put("allMyNotes",_notesList); //inicializamos que aqui se guardan todas 

        emit(FormSavedState());
      } catch (e) {
        emit(
          FormSavedErrorState(
              errorMsg: "Error al guardar las notas en storage..."),
        );
      }
    }
  }

  FutureOr<void> _onClearNotesFormEvent(
    ClearNotesFormEvent event,
    Emitter emit,
  ) {
    _notesController.clear();
    _chosenImage = null;
    emit(FormClearedState());
  }

  FutureOr<void> _onChangeImageEvent(
    ChangeImageEvent event,
    Emitter emit,
  ) async {
    emit(FormProcessingState());
    await _getImage();
    if (_chosenImage != null)
      emit(ImageChangedState(newImage: _chosenImage!));
    else
      emit(ImageChangedErrorState(errorMsg: "No se eligió imagen"));
  }

  FutureOr<void> _onDeleteNoteEvent(
    DeleteNoteEvent event,
    Emitter emit,
  ) async {
    try{
      emit(RetrievedNotesProcessingState());
      var _notesBox = await Hive.openBox<dynamic>("notes");
      _notesList = _notesBox.values.first;
      _notesList.removeAt(event.index);
      await _notesBox.put("allMyNotes",_notesList);
      emit(DeleteNoteState(notesList: _notesList));
    } catch (e) {
        emit(
          FormSavedErrorState(
              errorMsg: "Error al eliminar la nota"),
        );
      }
  }

  // Other methods
  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720, 
      imageQuality: 85,
    );
    if (pickedFile != null){
      _chosenImage = File(pickedFile.path);
    }
    else{
      print('No seleccionó nada');
      _chosenImage = null;
    }
  }
}
