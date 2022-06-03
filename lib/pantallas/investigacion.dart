import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';


import '../main.dart';



class Investigacion extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return FutureBuilder(
        future: getJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var posts=snapshot.data;
            return Scaffold(
              appBar:AppBar(leading: IconButton(
            onPressed:  ()=>Navigator.pushReplacement(context,  
              MaterialPageRoute(builder:  
                (context) => Mapas() 
                                )  
              )  ,
        icon: const Icon(Icons.home),
        
        ),
                      title: const Text('INVESTIGACIÓN'),
                      backgroundColor:const Color.fromARGB(255,147,26,43),),
              body:ListView.builder(
                  itemCount:posts.length,
                  itemBuilder: (context, index){
                     Map post=snapshot.data[index];
                     return  Wrap(
                        direction: Axis.horizontal ,
                        children: [
                          Column(
                            children: [Padding(
                              padding: const EdgeInsets.only(top:15,right: 50,bottom:30,left:10),
                              child: Center(child: GestureDetector(
                                onTap:()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => Html()  
            )  
         )  ,
                                child: Text(post['title']['rendered'],
                                                          style:const TextStyle(
                                                          fontWeight: FontWeight.bold, 
                                                          color:Color.fromARGB(255, 50, 50, 250),
                                                          fontSize: 15.0,
                                                          decoration: null,
                                                          fontFamily: 'Verdana',
                                                          ),
                                                       ),
                              )
                                                    ),
                                        ),
                                        Text(post['content']['rendered'],maxLines:3,
                                                          style:const TextStyle(
                                                          fontWeight: FontWeight.bold, 
                                                          color:Color.fromARGB(255, 50, 50, 250),
                                                          fontSize: 15.0,
                                                          decoration: null,
                                                          fontFamily: 'Verdana',
                                                          ),
                                                       ),
                                          //FadeInImage(
                                            //placeholder: AssetImage('assets/logo.jpeg'),
                                           // image:NetworkImage('logo_copabisi_2021_v2-768x221.png')     )
                            
                             Text(post['link'],
                                                          style:const TextStyle(
                                                          fontWeight: FontWeight.bold, 
                                                          color:Color.fromARGB(255, 50, 50, 250),
                                                          fontSize: 15.0,
                                                          decoration: null,
                                                          fontFamily: 'Verdana',
                                                          ),
                                                       ),],
                      
                          ),
                       ],
              );
            }
            )
          );
          } else if(snapshot.hasError) {
            return Scaffold(
              appBar:  AppBar(
                title:  Text('Demo'),
                centerTitle: true,
                backgroundColor: Colors.redAccent,
              ),
              body:  Column(
                children: <Widget>[ Text(snapshot.error.toString())], //Handle error in your own way
              ),
            );
          }else{
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}

Future<List> getJson() async {
  try {
    Uri apiUrl = Uri.parse('https://di.unsa.edu.ar/wp-json/wp/v2/pages');
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  } catch (e) {
    throw Exception('Problem with data'+e.toString());
  }
}

class Pagina extends StatelessWidget {
  const Pagina({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  

return Scaffold(
appBar: AppBar(title:Text('COPABISI'),
leading: IconButton(
            onPressed:  ()=>Navigator.pushReplacement(context,  
              MaterialPageRoute(builder:  
                (context) =>  Investigacion() 
                                )  
              )  ,
        icon: const Icon(Icons.close),
        
        ),
          backgroundColor:const Color.fromARGB(255,147,26,43),),
          
body:WebView(
  initialUrl: '',
)
);
  }
}



class Html extends StatefulWidget {
 
  LoadHtml createState() => LoadHtml();
 
}
 
class LoadHtml extends State<Html>{
 
  var HtmlCode = '<h1> h1 Heading Tag</h1>' +
                  '<h2> h2 Heading Tag </h2>' +
                     '<p> Sample Paragraph Tag </p>' +
                     '<img src="https://flutter-examples.com/wp-content/uploads/2019/04/install_thumb.png" alt="Image" width="250" height="150" border="3">' ;
 
 
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Render Raw HTML Code in Flutter')),
      body: WebView(
          initialUrl: new Uri.dataFromString(HtmlCode, mimeType: 'text/html').toString(),
        ),
    );
  }
}
