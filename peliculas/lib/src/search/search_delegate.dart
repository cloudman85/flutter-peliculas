import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam',
    'Ironman',
  ];

  final peliculasRecientes = [
    'Shazam',
    'Ironman',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /* final listaSugerida = (query.isEmpty) ? peliculasRecientes : peliculas.where((p)=> p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context,i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            seleccion = listaSugerida[i];
            showResults(context);
          },
        );
      },
    );*/
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((pelicula) {
              pelicula.uniqueId = '${pelicula.id}-search';
              return Hero(
                child: ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: () {
                    close(context, null);
                    Navigator.pushNamed(context, 'detalle',
                        arguments: pelicula);
                  },
                ),
                tag: pelicula.uniqueId,
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
