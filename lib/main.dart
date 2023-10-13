import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:formcls(),
    );
  }
}
class formcls extends StatefulWidget {
  const formcls({Key? key}) : super(key: key);

  @override
  State<formcls> createState() => _formclsState();
}

class _formclsState extends State<formcls> {
  var usernametextfield = TextEditingController();
  var passwordtextfield = TextEditingController();
  var form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true ,
        title: const Text("Login page"),backgroundColor: Colors.lightGreen,),
      body:Center(child:Column(children: [ const CircleAvatar(backgroundImage: AssetImage("Images/logi.jpg",),radius: 70,),const SizedBox(height: 50,)
        ,Form( key: form ,child:Column (mainAxisAlignment: MainAxisAlignment.center,
          children: [ TextFormField(controller: usernametextfield ,keyboardType:TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Enter the Email Id",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
            validator: (value){
              if(value!=null){
                if(value.length>5 && value.contains("@gmail")&& value.endsWith(".com")){
                  return null ;
                }
                return " Enter valid user name ";
              }
            },),
            SizedBox(height: 20,),

            TextFormField(controller: passwordtextfield ,
                decoration: InputDecoration(
                    hintText: "Enter the Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
                validator: (value) {
                  RegExp text = RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                  if (value!.isEmpty) {
                    if (text!.hasMatch(value)) {
                      return null;
                    }


                    return "please enter the valid password";
                  }
                }),
            const SizedBox(height: 20,),



            TextButton(onPressed: (){
              if(form.currentState!.validate()){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => secondpage(userName: usernametextfield.text,passWord: passwordtextfield.text,)));

              }
            }, child: Text("LOGIN"))

          ]

          ,) ,),],)
      ),);

  }
}
class secondpage extends StatefulWidget {
  const secondpage({Key? key,required this.userName,required this.passWord}) : super(key: key);
  final String userName;
  final String passWord;
  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text("second page"),),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(widget.userName),
          Text(widget.passWord),
        ],),)
    );
  }
}

