import 'package:flutter/material.dart';
import 'home_controller.dart';

class home_view extends StatelessWidget {
  const home_view({super.key}); 

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        backgroundColor: Color(0xFF6200EE),
      ),
      body: FutureBuilder(
        future: controller.fetchData(''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: \\${snapshot.error}'));
          } else {
            if (controller.titles.isEmpty) {
              return Center(child: Text('No books found'));
            }
            return ListView.builder(
              itemCount: controller.titles.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(controller.titles[index]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author: ${controller.authors[index]}'),
                        Text('Published: ${controller.publishedDates[index]}'),
                        Text('ISBN: ${controller.isbns[index]}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}