import 'package:flutter/material.dart';

final List<Map<String, dynamic>> daftarBarang = [
  {'nama':'Buku Tulis', 'anggota': 3000, 'umum':3500, 'stok':40},
  {'nama':'Pulpen', 'anggota': 2500, 'umum':3000, 'stok':25},
  {'nama':'Roti', 'anggota': 35000, 'umum':5500, 'stok':15},
  {'nama':'Manik-manik', 'anggota': 5000, 'umum':5500, 'stok':29},
  {'nama':'Susu UHT', 'anggota': 6000, 'umum':8000, 'stok':35},
  {'nama':'Buku Gambar', 'anggota': 5000, 'umum':6500, 'stok':31},
  {'nama':'Permen Lolipop', 'anggota': 500, 'umum':1000, 'stok':87},
  {'nama':'Coklat Premium', 'anggota': 8500, 'umum':9000, 'stok':5},
  {'nama':'Roti Goreng', 'anggota': 4000, 'umum':5500, 'stok':49},
  {'nama':'Rautan Pensil', 'anggota': 500, 'umum':1000, 'stok':0},
];
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  int stok = 40;
  String kategori = 'atk';

  IconData getIcon(String kategori) {
    switch (kategori) {
      case 'atk':
        return Icons.edit_note;
      case 'makanan':
        return Icons.lunch_dining;
      case 'minuman' :
        return Icons.local_drink; 
      case 'inventaris':
        return Icons.inventory_2;
      default:
        return Icons.category;
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            if (barang['stok'] == 0) {
              return const SizedBox.shrink();
            }
            return Card (
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(getIcon('inventaris')),
                title: Text(barang['nama']),
                subtitle: Text('Anggota Rp' + barang['anggota'].toString()),
                trailing: Text('Stok' + barang['stok'].toString()),
              ),
            );
          }
        ),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
