import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider{
  String _apiKey   = '8fccc107080f5289b6a67e92a34528ff';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-ES';


  Future<List<Pelicula>> getEnCines() async{
    
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language' : _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(decodedData['results']);


    for( var i in peliculas.items){
      print(i.posterPath);
    }
  }
}