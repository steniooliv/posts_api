import 'package:flutter/material.dart';
import 'package:posts_api/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your Posts",
          style: TextStyle(fontSize: 28, color: Colors.pink[700]),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.posts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.pink[500],
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${controller.posts[index].id}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${controller.posts[index].title!.length <= 33 ? controller.posts[index].title : controller.posts[index].title!.substring(0, 33) + "..."}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[700],
        onPressed: () async {
          await controller.getPosts();
          setState(() {});
        },
        child: Icon(
          Icons.refresh,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
