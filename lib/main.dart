import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'views/skills_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Inicialize o Firebase para web com FirebaseOptions
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAwm_K10EwfvFeRSv_dNSWx1q04HvkF07Y",
        authDomain: "n2mobile-e5275.firebaseapp.com",
        projectId: "n2mobile-e5275",
        storageBucket: "n2mobile-e5275.firebasestorage.app",
        messagingSenderId: "293660555120",
        appId: "1:293660555120:web:b3c7ad958f2d3d92b201b5",
        measurementId: "G-JVBLXRSXGW",
      ),
    );
  } else {
    // Inicialize para Android/iOS (caso deseje testar em outras plataformas no futuro)
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skill Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SkillsListScreen(),
    );
  }
}
