import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBNz9pOA_jcNiRDEN-8Qb1c1MgMno81cq0";
const ID_CANAL = "UCb3zvhvEp9ObSZPD6jBsuTg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  List<Video> lista = new List<Video>();

  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&channelId=UCEn6kONg6EC_Ylh0RlInsMw"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&q=$pesquisa");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson =
          json.decode(response.body); //converteu json pra um map
      print(dadosJson["items"][3]["snippet"]["title"].toString()); //o indice [x] é o resultado correspondente, 3 video ..

      List<Video> videos =
          dadosJson["items"].map<Video>(//percorrer todos os itens
              (map) {
        return Video.fromJson(map);
      }).toList();
      return videos;

//      for(var video in videos){
//        print(video.titulo);
//      }

      //metodo 1
//      for(var dados in dadosJson["items"]){
//        Video v = new Video(
//            dados["snippet"]["title"],);
//        print(dados["snippet"]["title"]);
//      }

    } else
      print("deu error");
  }
}
