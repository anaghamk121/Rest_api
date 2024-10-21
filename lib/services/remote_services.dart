import 'package:rest_api/models/comments.dart';
import 'package:http/http.dart' as http;

class RemoteServices{
  Future<List<Comments>?> getComments() async
  {
var client = http.Client();
var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
 var response = await client.get(uri);
 if(response.statusCode == 200)
   {
     var json = response.body;
     commentsFromJson(json);
   }
  }
}