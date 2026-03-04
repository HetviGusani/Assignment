import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController feedback = TextEditingController();

  var _formkey = GlobalKey<FormState>();

  var pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  late RegExp regExp = RegExp(pattern);

  late String dropValue = items[0];

  List items = [
    "Service Quality",
    "Product Quality",
    "Customer Support",
    "App/Website Experience",
    "Suggestion & Improvements",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback Form")),
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
                  validator: (value) {
                    if (name.text.isEmpty) {
                      return "Enter Name";
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
                  validator: (value) {
                    if (!regExp.hasMatch(email.text.toString())) {
                      return "Enter Valid E-Mail";
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
                  validator: (value) {
                    if (value?.length != 10) {
                      return "Number must be of 10 digits";
                    }
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: DropdownButton<String>(
                    value: dropValue,
                    isExpanded: true,
                    hint: Text("Select Category"),
                    items: items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropValue = value!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: 4,
                  controller: feedback,
                  decoration: InputDecoration(
                    hintText: "Write Your Feedback Here",
                    border: OutlineInputBorder()
                  ),validator: (value){
                    if(feedback.text.isEmpty){
                      return "Fill this Field.";
                    }
                },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Form Submitted")));
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
