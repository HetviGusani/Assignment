import 'package:flutter/material.dart';

class RForm1 extends StatefulWidget {
  const RForm1({super.key});

  @override
  State<RForm1> createState() => _RForm1State();
}

class _RForm1State extends State<RForm1> {
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  var pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  late RegExp regExp = RegExp(pattern);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(pass.text.isEmpty){
                      return "Enter Password";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Enter E-Mail",
                    border: OutlineInputBorder(),
                  ),
                  validator: (vakue) {
                    if (!regExp.hasMatch(email.text.toString())) {
                      return "Enter Valid E-Mail";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(pass.text.isEmpty){
                      return "Enter Password";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: mobile,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Mobile Number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value?.length!=10){
                      return "Number must be of 10 digits";
                    }
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Form Submitted")));
                  }
                }, child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
