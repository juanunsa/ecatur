import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../main.dart';
import 'package:wordpress_api/wordpress_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
void main() async {
  final api = WordPressAPI('https://di.unsa.edu.ar/wp-json/wp/v2/pages/');
  final res = await api.pages.fetch();

  for (final post in res.data as List<Page>) {
    print(WPUtils.parseHtml(post.content));
  }
}*/  //no anduvo
 

 class WebViewExample extends StatefulWidget {


   @override
   WebViewExampleState createState() => WebViewExampleState();
 }

 class WebViewExampleState extends State<WebViewExample> {
   @override
   void initState() {
     super.initState();
     // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
    Uri dominio = Uri.parse("https://di.unsa.edu.ar/wp-json/wp/v2/pages/");

Future <List> paginas() async{
final response= await http.get(dominio,headers: {'Accept':'aplication/json'});
var convertirjson=jsonDecode(response.body);
return convertirjson;
}

   @override
   Widget build(BuildContext context) {
    
     return 
     
     Scaffold(
       appBar: AppBar(title:Text('Investigación'),
        leading: IconButton(
            onPressed:  ()=>Navigator.pushReplacement(context,  
              MaterialPageRoute(builder:  
                (context) => actual() 
                                )  
              )  ,
        icon: const Icon(Icons.home),
        
        ),

       ),
      body: FutureBuilder(
        future:paginas(),
        builder:(BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            var posts=snapshot.data;
            return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: posts.length,
                    itemBuilder:(context, index){
                      Map post=snapshot.data[index];
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: <Widget> [
                           
                            Text(post['title']['rendered'],style:TextStyle(fontSize: 24,backgroundColor: Colors.lightBlue )),
                            Text(post['content']['rendered'],maxLines: 5,),
                          ],
                        ),
                      );
                    } );

          }
          else{return Center(child: CircularProgressIndicator());}
        }
      )
     );
    
   }
 }