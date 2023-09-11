

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navegacion/dominio/models/event.dart';

import '../../datos/events_list.dart';
import '../widgets/menu_appbar.dart';
import '../widgets/menu_drawer.dart';
import 'home_page.dart';



class EventoRegistro extends StatefulWidget {
  const EventoRegistro({super.key});

  @override
  State<EventoRegistro> createState() => _EventoRegistroState();
}

class _EventoRegistroState extends State<EventoRegistro> {
   final _formKey = GlobalKey <FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String photo = '';
  Future <void> _pickImage() async {
    final pickImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickImage != null) {
        setState((){
          photo = pickImage.path;
        });
  }
  }

Widget _buildAvatarChild() {
  if (photo.isNotEmpty) {
    return Image.network(
      photo,
      width: 140, // Ancho de la imagen
      height: 140, // Alto de la imagen
      fit: BoxFit.cover, // Ajusta la imagen al círculo
    );
  } else {
    return ElevatedButton(
      onPressed: _pickImage,
      child: Icon(
        Icons.photo_camera,
        size: 30,
      ),
    );
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MenuAppbar(),
      drawer:  NavegationDrawer(),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child:
      Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/img/sostenible.jpg',
              fit: BoxFit.cover,
              color: Color.fromARGB(6, 128, 125, 125),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 13),
              Row(
                children: [
                  Column(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: 27,
                        // height: 17,
                        child: IconButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, icon:  Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(137, 17, 17, 17),
                          size: 25,
                        ),)
                      ),
                    ],
                  ),
                const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 274,
                        height: 44,
                        child: Text(
                          'Registrar Eventos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(230, 255, 255, 255),
                            fontSize: 25,
                            fontFamily: 'Inconsolata',
                            fontWeight: FontWeight.w400,
                            height: 0.62,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
CircleAvatar(
                backgroundColor: Color.fromARGB(207, 247, 237, 237),
                radius: 70.0,
                child: _buildAvatarChild(),),
      //FORMULARIO
        SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      shrinkWrap: true,
            children: [
SizedBox(height:8.0),              
Container(
  width: 275,
  height: 60,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(6),
    border: Border.all(width: 0.50, color: Color(0xFF545F70)),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: 'Nombre:',
          border: InputBorder.none,
          labelStyle: TextStyle(
            fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: 1.43,
          letterSpacing: 0.10,),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, ingrese un nombre';
          }
          return null;
        },
      ),
      
    ],
  ),
),

SizedBox(height: 8),
Container(
  width: 275,
  height: 60, 
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8), 
    border: Border.all(width: 0.50, color: Color(0xFF545F70)), 
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        controller: _descriptionController,
        decoration: InputDecoration(
          labelText: 'Descripción:',
          border: InputBorder.none, 
          labelStyle: TextStyle(
            fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: 1.43,
          letterSpacing: 0.10,),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, ingrese una descripción';
          }
          return null;
        },
      ),
       
    ],
  ),
),
 SizedBox(height: 8),
Container(
  width: 275,
  height: 60, 
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8), 
    border: Border.all(width: 0.50, color: Color(0xFF545F70)), 
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center, 
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        controller: _locationController,
        decoration: InputDecoration(
          labelText: 'Ubicación:',
          border: InputBorder.none,
          labelStyle: TextStyle(
            fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: 1.43,
          letterSpacing: 0.10,),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, ingrese una ubicación';
          }
          return null;
        },
      ),
    
    ],
  ),
),
SizedBox(height: 8),
Container(
  width: 275,
  height: 60, 
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8), 
    border: Border.all(width: 0.50, color: Color(0xFF545F70)), 
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center, 
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     
      
     TextFormField(
  controller: _dateController,
  onTap: () {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000),
      maxTime: DateTime(2101),
      onConfirm: (date) {
        setState(() {
      
          _dateController.text = date.toString();
        });
      },
      currentTime: DateTime.now(),

    );
  },
  decoration: InputDecoration(
    labelText: 'Fecha:',
    border: InputBorder.none,
    labelStyle: TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      height: 1.43,
      letterSpacing: 0.10,
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese una fecha';
    }
    return null;
  },
)

     
    ],
  ),
),



            ],
          ),
        ),),
          
          SizedBox(height:3.0),       
               
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                     onPressed: () {
                          
                    if (_formKey.currentState!.validate()) {
                      var newEvent = Event(name: _nameController.text, description: _descriptionController.text, location: _locationController.text, date: _dateController.text, photo: photo); 

                      events.add(newEvent);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                        
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Successful registration')),
                      
                      );
                    }
                     
                        },
                         style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.green,
                    // ignore: deprecated_member_use
                    onPrimary: Colors.white,),
                        child: const Text('Registrar'),
                      ),
                ),
                
            ],
          ),
        ]),
      )
      );

          

   
  }
}

class DatePicker {
  static void showDatePicker(BuildContext context, {required bool showTitleActions, required DateTime minTime, required DateTime maxTime, required Null Function(dynamic date) onConfirm, required DateTime currentTime}) {}
}