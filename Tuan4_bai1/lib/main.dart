import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomeScreen(user: snapshot.data!);
          }
          return SignInScreen(); // Nếu chưa đăng nhập, quay lại màn hình đăng nhập
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? errorMessage;

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('User canceled the Google sign-in process.');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase-Auth')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _signInWithGoogle,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Login by Gmail',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          if (errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Google Sign-in Failed\n$errorMessage',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({required this.user});

  // Function to clear the local storage cache
  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();  // Clears all the data in SharedPreferences
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      // Xóa bộ nhớ cache (SharedPreferences, nếu có)
      await clearCache();

      // Đăng xuất khỏi Google
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      
      // Đăng xuất khỏi Firebase
      await FirebaseAuth.instance.signOut();

      // Sau khi đăng xuất, điều hướng người dùng về màn hình đăng nhập
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (Route<dynamic> route) => false,  // Loại bỏ tất cả các route hiện tại
      );
    } catch (e) {
      // Xử lý lỗi nếu cần
      print('Error during sign out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase-Auth-Success')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _signOut(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Đăng xuất',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Success!',
                    style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hi ${user.email}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Welcome to UTLSmartTasks',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
