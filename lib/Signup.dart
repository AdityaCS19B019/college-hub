import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'dart:convert';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String username = "";
  String email = "";
  String Password = "";
  bool is_teacher = false;
  String errormsg = "";
  bool is_error = false;
  bool is_student = false;
  String role = "";
  String profilepic = 'https://cache.bmwusa.com/cosy.arox?pov=walkaround&brand=WBBM&vehicle=23SO&client=byo&paint=P0300&fabric=FMAH7&sa=S01RF,S0302,S0319,S0322,S03AG,S03MC,S03MQ,S0420,S0423,S0493,S04MC,S0552,S05AS,S05AV,S0688,S06AC,S06AK,S06C4,S06U3&quality=70&bkgnd=transparent&resp=png&angle=60&w=10000&h=10000&x=0&y=0';
  String name = "Test";

  Future<void> Signup() async {

    final client = RetryClient(http.Client());
    print("un - $username----email - $email---role - $role");
    try {
        var response = await client.post(
            Uri.https('college-hub-service.onrender.com', 'auth/createuser'),
            body: {'username': username, 'password': Password , 'profilepic' : profilepic , 'role' : role}
        );
        Map res = jsonDecode(response.body);
        // print(res);
        if(res['success'])
        {
          Navigator.popAndPushNamed(context, '/');
        }
        else
        {
          setState(() {
            is_error = true;
            errormsg = res['msg'];
          });
        }
      }catch(e){
        print(e);
        setState(() {
          is_error = true;
          errormsg = "Error try again";
        });
      } finally {
        client.close();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: Form(
        child: Container(
            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.15, 0, MediaQuery.of(context).size.width*0.15, 0),
            child :Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Visibility(
                visible: is_error,
                child: Center(
                  child: Text(
                    errormsg,
                    style: TextStyle(
                      color: Colors.red
                    ),
                    ),
                  )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              TextFormField(
                onChanged: (val){
                  username = val;
                  setState(() {   
                      // errormsg = "Incorrect Details";
                      is_error = false;
                    });
                },
                decoration: InputDecoration(
                  labelText: "Enter your username",
                ),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              TextFormField(
                onChanged: (val){
                  email = val;
                  if(is_error)
                  {
                    setState(() {   
                      // errormsg = "Incorrect Details";
                      is_error = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Enter your email address",
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              TextFormField(
                onChanged: (val){
                  Password = val;
                  if(is_error)
                  {
                    setState(() {   
                      // errormsg = "Incorrect Details";
                      is_error = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Enter your Password",
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        is_teacher = true;
                        is_student = false;
                        role = "teacher";
                      });
                    }, 
                    icon: Icon(
                      Icons.school,
                      size: 36,
                      color: is_teacher ? Colors.green : Colors.black,
                    ),
                    
                  ),
                  IconButton(
                    style: ElevatedButton.styleFrom(

                    ),
                    onPressed: (){
                      setState(() {
                        is_teacher = false;
                        is_student = true;
                        role = "student";
                      });
                    }, 
                    icon: Icon(
                      Icons.person,
                      size: 36,
                      color: is_student ? Colors.green : Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              ElevatedButton(
                onPressed: (){
                  Signup();
                },
                child: Text("Signup"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}