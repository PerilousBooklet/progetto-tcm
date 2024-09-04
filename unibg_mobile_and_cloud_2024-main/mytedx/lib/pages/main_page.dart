import 'package:flutter/material.dart';
import 'package:mytedx/pages/profile_page.dart';
import 'package:mytedx/ui/talks_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedPage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TedQuiz'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'TedQuiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.video_collection),
              title: const Text('Pagina principale'),
              onTap: () {
                setState(() {
                  selectedPage = 'mainpage';
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                setState(() {
                  selectedPage = 'profile';
                });
              },
            ),
          ],
        ),
      ),
      body: Center(child: Builder(
        builder: (context) {
          if (selectedPage == "profile") {
            return const ProfilePage();
          }
          return TalksList();
        },
      )),
    );
  }
}
