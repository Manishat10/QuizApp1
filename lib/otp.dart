import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myappb/login.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginOtp extends StatefulWidget {
  const LoginOtp({super.key});

  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code='';
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
                  "Enter The OTP",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                Pinput(
                  onChanged: (value){
                    otpController.text =value;

                  },
                  length: 6,
                  validator: (s) {
                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: loginFirst.verificationId!,
                        smsCode: otpController.text,
                      );
                      FirebaseAuth.instance.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(context, "Home", (route) => false);
                      return null;
                    }catch(e){
                      return 'pin is incorrect';
                    }
                   },
                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Didn't receive code?\n  Resend",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        print("Verification ID: ${loginFirst.verify}");
                        print("Entered OTP: $code");

                        if (loginFirst.verify == null) {
                          print("Verification ID is null. OTP verification might be pending.");
                          return;
                        }

                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: loginFirst.verify!,
                          smsCode: code,
                        );

                        await auth.signInWithCredential(credential);
                        Navigator.pushNamedAndRemoveUntil(
                            context, "Home", (route) => false);
                      } catch (e) {
                        print("Error during sign in: $e");
                        print("Wrong OTP or Verification ID");
                      }
                    },

                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    child: const Text(
                      " Get Started ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.grey,
                      child: const Icon(CupertinoIcons.back),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
