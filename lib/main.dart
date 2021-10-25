import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Home(),
      debugShowCheckedModeBanner: false,

    );


  }
}
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    AudioCache audioCache=AudioCache();
    AudioPlayer audioPlayer=AudioPlayer();
   List<String> questions = ["Today's Date?", "Yesterdays's Date?","What is 1+2?","What is 12+5?"];
    List<String> options = ["17/10,08/10,15/10,14/10","20/10,16/10,15/10,18/10","13,5,7,3","17,5,6,7"];
     List<String> answers = ["17/10", "16/10","3","17"];
     String selectedValue = "";
     int _score=0;
     int i=0;
     bool isFinished=false;
     bool showResultStatus=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      title:Center(
        child: Text('quiz',style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          
        ),
        
        ),
        
      ),
    
      ),
      body: Column (
        children: [
          SizedBox(height: 20,),
          Text(questions[i],
          style: TextStyle(
            fontWeight:FontWeight.bold, 
            fontSize: 40,
            ),
            ),
            ListTile(
              title: Text(options[i].split(",")[0],
              style: TextStyle(
                fontSize: 35,
              ),
              ),
              leading: Radio<String>(
            value: options[i].split(",")[0],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
                if(selectedValue==answers[i]){
                  // _score++;
                   
                  // print("correct");
                }
              
              }
              );
            },
          ),

          ),
          ListTile(
              title: Text(options[i].split(",")[1],
              style: TextStyle(
                fontSize: 35,
              ),
              ),
              leading: Radio<String>(
            value: options[i].split(",")[1],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
                if(selectedValue==answers[i]){
                  // _score++;
                  // print("correct");
                   
                }
              
              }
              );
            },
          ),

          ),
          ListTile(
              title: Text(options[i].split(",")[2],
              style: TextStyle(
                fontSize: 35,
              ),
              ),
              leading: Radio<String>(
            value: options[i].split(",")[2],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
                if(selectedValue==answers[i]){
                  // _score++;
                  // print("correct");
                   
                }
              
              }
              );
            },
          ),

          ),
          ListTile(
              title: Text(options[i].split(",")[3],
              style: TextStyle(
                fontSize: 35,
              ),
              ),
              leading: Radio<String>(
            value: options[i].split(",")[3],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
                if(selectedValue==answers[i]){
                  // _score++;
                  // print("correct");
                   
                }
              
              }
              );
            },
          ),

          ),
          Row(
            children: [
              Spacer(),
              IconButton(onPressed: (){
              setState(() {
                if(selectedValue==answers[i]){
                  _score++;
                  // print("correct");
                }

                if((selectedValue==options[i].split(",")[0])||(selectedValue==options[i].split(",")[1])||(selectedValue==options[i].split(",")[2])||(selectedValue==options[i].split(",")[3])){
                if(i==options.length-1){
                  isFinished=true;
                  String alert =isFinished ? 'Exam is over' : '';
                  audioCache.load('song.mp3');
                  audioCache.play('song.mp3');
                  print("exam has been finished");

 Alert(
      context: context,
      type: AlertType.error,
      title: "Score: $_score",
      desc: "Exam finished",
      buttons: [
        DialogButton(
          child: Text(
            "good work",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    setState(() {
      i=0;
      _score=0;
      selectedValue='';
    });
                  
                }else{
                  
                  i++;
                }
                  
                }

              }
              
              );
              

              }, 
              icon:Icon(Icons.arrow_forward)),
              

              Spacer(),
            ],

          ),
           SizedBox(height: 20,),
          Text('$_score',
          style: TextStyle(
            fontWeight:FontWeight.bold, 
            fontSize: 40,
            ),
            ),
            Container(

                child: isFinished==true
                ? Image.asset(
                  "assets/exam.jpg",
                  
                )
                :Text(''),
              
               
              ),
          
      ],
      ),
    );
  }
}
