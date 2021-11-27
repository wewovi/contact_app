import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true, // Set to true
      locale: DevicePreview.locale(context),
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: ContactHomeView(),
    );
  }
}

class ContactHomeView extends StatelessWidget {
  ContactHomeView({Key? key});

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "My Contacs",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: const [
            CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/photos/attractive-businesswoman-using-a-digital-tablet-while-standing-in-of-picture-id1164863397")),
          ],
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "search by name or contact",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTileWidget(),
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                  height: 2,
                ),
            itemCount: 50));
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://media.istockphoto.com/photos/smiling-indian-business-man-working-on-laptop-at-home-office-young-picture-id1307615661"),
      ),
      title: const Text(
        "Mary Immaculate",
        style: TextStyle(color: Colors.grey, fontSize: 20),
      ),
      subtitle: const Text("+233207885790", style: TextStyle(fontSize: 15)),
      trailing:
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
    );
  }
}
