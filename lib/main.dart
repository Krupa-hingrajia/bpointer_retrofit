import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_bpointer/core/api_client.dart';
import 'package:retrofit_bpointer/core/model.dart';
import 'package:retrofit_bpointer/ui/data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User>? posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retrofit"),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DataScreen(
                        post: posts,
                      )));
        },
        child: const Text("SHOW"),
      ),
    );
  }

  FutureBuilder<List<User>> _buildBody(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<User>>(
        future: client.getUsers(),
        // builder: (context, snapshot) {
        //   if (snapshot.connectionState == ConnectionState.done) {
        //     print("**********************************${snapshot.hasData}");
        //     posts = snapshot.data ?? [];
        //     print("*******************POSTS${posts}");
        //    // return Text("*******************************${posts}");
        //     return _buildPosts(context, posts!);
        //   } else {
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        // }

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            posts = snapshot.data ?? [];
            return _buildPosts(context, posts!);
          } else {
            return const Center(child: Text('No Data'));
          }
        });
  }

  ListView _buildPosts(BuildContext context, List<User> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].id.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].title.toString()),
          ),
        );
      },
    );
  }
}
