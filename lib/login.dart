
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class loginFirst extends StatefulWidget {
  loginFirst({super.key});
  static String ?verify ;
  static String ?verificationId;

  @override
  State<loginFirst> createState() => _loginFirstState();
}

class _loginFirstState extends State<loginFirst> {
  TextEditingController countryCode = TextEditingController();
  var phone="";
  @override
  void initState() {
    // TODO: implement initState
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/img.png"),
                  width: 250,
                  height: 200,
                ),
                const Text(
                  "Phone Verification",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "We Need to Verify Your Phone number Before getting started!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 30,
                        child: TextField(
                          controller: countryCode,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.black26,
                        ),
                      ),
                      const Text(
                        "|",
                        style: TextStyle(fontSize: 40, color: Colors.grey),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value){
                            phone=value;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Phone number ",
                          ),
                          cursorColor: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async{
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${countryCode.text+phone}',
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          loginFirst.verify=verificationId;
                          Navigator.pushNamed(context, "otp");
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    child: const Text(
                      " Next ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
