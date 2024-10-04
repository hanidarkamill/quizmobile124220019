import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isPasswordVisible = false; // Variabel untuk melacak status visibilitas password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 231, 24),
        centerTitle: true,
        title: const Text(
          'Supermarket UPN',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          height: 800,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(image: AssetImage('assets/upnLogo.png')),

                // TextField untuk Username
                TextField(
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Username',
                  ),
                ),

                // TextField untuk Password
                TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: !isPasswordVisible, // Mengatur visibilitas teks password
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Menentukan ikon berdasarkan status visibilitas password
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          // Mengubah status visibilitas password
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 250, 231, 24)),
                      foregroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    onPressed: () {
                      if (username == 'hanidarkamil' && password == '000000') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Login Anda Berhasil!'),
                          backgroundColor: Color.fromARGB(255, 158, 230, 132),
                        ));
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(username: username)),
                          );
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Username atau Password yang anda masukkan salah.'),
                          backgroundColor: Color.fromARGB(255, 229, 122, 114),
                        ));
                      }
                    },
                    child: const Text('Login', style: TextStyle(fontSize: 20)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
