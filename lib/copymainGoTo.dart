// // import 'dart:ffi';
// // import 'package:http/http.dart';
// import 'package:flutter/material.dart';
// import 'package:mainfttr/Nxt_Pg_Class.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:untitled/3rd_pg_class.dart';
// // import 'package:untitled/Nxt_Pg_Class.dart';
// // import 'package:flutter/rendering.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }


// class _MyHomePageState extends State<MyHomePage> {
//   var data = TextEditingController();
//   var textctrl1 = TextEditingController();
//   var textctrl2 = TextEditingController();
//   int data  = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: TextField(
//               controller: data,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => GoTo()),
//                 );
//               },
//               child: Text("Goto"),
//             ),
//           ),
//            Container(
//             child: TextField(
//               controller: textctrl2,
//               decoration: InputDecoration(
//                 hint: Text("Enter The text"),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             child: ElevatedButton(
//               onPressed: () {
//                 var no1 = int.parse(textctrl1.text.toString());
//                 var no2 = int.parse(textctrl2.text.toString());
//                 data = no1 + no2 ;
//                 setState(() {});
//               },
//               child: Text("Add"),
//             ),
//           ),
//           Container(child: Text("$data")),
          
//         ],
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fake Store',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: "Fake Store"),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Future<List<dynamic>> _products;

//   Future<List<dynamic>> fetchProducts() async {
//     final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception("Failed to load products");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _products = fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: _products,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else {
//             final products = snapshot.data!;
//             return GridView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: products.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // two columns
//                 childAspectRatio: 0.65, // height ratio
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//               ),
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ProductCard(product: product);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Map<String, dynamic> product;
//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shadowColor: Colors.black26,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       clipBehavior: Clip.hardEdge,
//       child: InkWell(
//         onTap: () {
//           // optional: navigate to a detail page
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: Text(product['title']),
//               content: Text(product['description']),
//             ),
//           );
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             AspectRatio(
//               aspectRatio: 1,
//               child: Image.network(
//                 product['image'],
//                 fit: BoxFit.contain,
//               ),
//             ),

//             // Product Details
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 product['title'],
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(
//                 product['category'].toString().toUpperCase(),
//                 style: TextStyle(
//                   color: Colors.grey[600],
//                   fontSize: 12,
//                 ),
//               ),
//             ),

//             const Spacer(),

//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "₹ ${(product['price'] * 80).toStringAsFixed(2)}",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
