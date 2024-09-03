import 'package:flutter/material.dart';
import 'pages/talkpage.dart';
import 'pages/loginpage.dart';
import 'ted_repository.dart';
import 'package:mytedx/models/talk_mainpage.dart';
import 'ui/talks_list.dart';

// TODO: data sync once every app start
// TODO: salvare i dati nel JSON interno

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner (located in top right corner of appbar)
      title: 'TedX Quiz',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TedX Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// This is the type used by the popup menu below.
enum SampleItem { itemOne, itemTwo, itemThree }

// List of all talks
TedRepository tedrepo = TedRepository();
final Future<List<TalkMainPage>?> talks = tedrepo.getTalkList();

// Main
class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _searchController = TextEditingController();
  SampleItem? selectedItem; // Used for the PopupMenu
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Menu Button
        leading: PopupMenuButton<SampleItem>(
          icon: const Icon(Icons.menu),
          initialValue: selectedItem,
          onSelected: (SampleItem item) {
            // ?
            setState(() {
              selectedItem = item;
            });
            // ?
            if (item == SampleItem.itemOne) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            }
            // ?
            if (item == SampleItem.itemTwo) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('Log In'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemTwo,
              child: Text('Log Out'),
            ),
          ],
        ),
        
        // App bar theme
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // App bar title
        title: const Center(
          child: Text('TedX Quiz'),
        ),
      ),
      
      // Main page body
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
                // Add a search icon or button to the search bar
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Perform the search here
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            // List of talks
            TalksList(),
          ],
        ),
      ),
    );
  }
}
