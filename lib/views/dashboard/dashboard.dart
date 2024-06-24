import 'package:apotik_app/views/auth/login.dart';
import 'package:apotik_app/views/obat/create.dart';
import 'package:apotik_app/views/obat/list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late SharedPreferences logindata;
  late String email;

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email')!;
    });
  }

  @override
  void initState() {
// ignore: todo
// TODO: implement initState
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 255, 13),
        title: const Text("RUMAH APOTIK"),
      ),
      backgroundColor: const Color.fromARGB(255, 69, 254, 91),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 50, top: 50),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/logo-apotik.png',
                    height: 200,
                    width: 200,
                  ),
                ],
              )),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.list,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListObatScreen()));
            },
            label: const Text("Lihat Obat", style: TextStyle(fontSize: 24)),
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.black, primary: Colors.deepOrange),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.plus_one, size: 24),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateObatScreen()));
            },
            label: const Text("Tambah Obat", style: TextStyle(fontSize: 24)),
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.black, primary: Colors.lightBlue),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.logout, size: 24),
            onPressed: () {
              logindata.setBool('login', true);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            label: const Text("Logout", style: TextStyle(fontSize: 24)),
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.black, primary: Colors.red),
          ),
        ]),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Tentang Aplikasi - RUMAH APOTIK"),
      ),
      backgroundColor: const Color.fromARGB(255, 109, 64, 255),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Kembali"),
        ),
      ),
    );
  }
}
