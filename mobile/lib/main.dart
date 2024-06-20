import 'package:flutter/material.dart';
import 'pages/talk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide debug banner (located in top right corner of appbar)
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _searchController = TextEditingController();
  
  // List of all talks
  // ?
  
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
        // Settings Button
        leading: const Icon(Icons.menu),

        // TODO: menu
        
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Search Bar underneath App Bar
        title: const Center(
          child: Text('APP BAR'),
        ),
        // Search Bar inside App Bar
        //title: Container(
        //  // Add padding around the search bar
        //  padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //  // Use a Material design search bar
        //  child: TextField(
        //    controller: _searchController,
        //    decoration: InputDecoration(
        //      hintText: 'Search...',
        //      // Add a clear button to the search bar
        //      suffixIcon: IconButton(
        //        icon: Icon(Icons.clear, color: Colors.black,),
        //        onPressed: () => _searchController.clear(),
        //      ),
        //      // Add a search icon or button to the search bar
        //      prefixIcon: IconButton(
        //        icon: Icon(Icons.search, color: Colors.black,),
        //        onPressed: () {
        //          // Perform the search here
        //        },
        //      ),
        //      // border: OutlineInputBorder(
        //      //   borderRadius: BorderRadius.circular(20.0),
        //      // ),
        //    ),
        //  ),
        //)
      ),
      
      // Main page body
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
                // Add a search icon or button to the search bar
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
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
            
            // placeholder
            TextButton(
              child: Text("Button"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Talk()));
              },
            )
          ],
        ),
      ),
    );
  }
}
