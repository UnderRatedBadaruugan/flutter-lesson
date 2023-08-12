import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController(); 
  final _passCtrl = TextEditingController(); 

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      print("Amjilttai");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's sign you in.",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                Text(
                  "Wellcome back.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28
                  ),
                ),
                Text(
                  "You've been missed!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _phoneCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Хоосон байж болохгүй";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.9),
                        width: 1
                      )
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
      
                    ),
                    label: Text("Утасны дугаар")
                  ),
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  controller: _passCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Хоосон байж болохгүй";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.9),
                        width: 1
                      )
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
      
                    ),
                    label: Text("Нууц үг")
                  ),
                   style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _onSubmit, child: Text("Нэвтрэх"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                    // Change your radius here
                    borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}