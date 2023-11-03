import 'package:flutter/material.dart';
import 'package:pruebadoctor/consultas.dart';
import 'home_consultas.dart'; 

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:ConsultasScreen(consultas: consultasAgendadas), 
  ));
}