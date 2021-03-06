import 'package:contacts_app/models/contact.dart';
import 'package:contacts_app/pages/contactDetails.dart';
import 'package:contacts_app/pages/delete.dart';
import 'package:flutter/material.dart';

class ContactHomeView extends StatefulWidget {
  ContactHomeView({Key? key});

  @override
  State<ContactHomeView> createState() => _ContactHomeViewState();
}

class _ContactHomeViewState extends State<ContactHomeView> {
  final contactApp = [
    Contact(
        number: "+233207885790",
        id: "0",
        name: "Jonas Wewovi",
        email: "wewovi10.jw@gmail.com"),
    Contact(
        number: "+233207885790",
        id: "1",
        name: "Mary Immaculate",
        email: "immacucu@gmail.com"),
    Contact(
        number: "+233207885790",
        id: "2",
        name: "Joan Odoi",
        email: "joanodoi12@gmail.com"),
    Contact(
        number: "+233207885790",
        id: "3",
        name: "Joan Odoi",
        email: "joanodoi12@gmail.com"),
    Contact(
        number: "+233207885790",
        id: "4",
        name: "Joan Odoi",
        email: "joanodoi12@gmail.com"),
    Contact(
        number: "+233207885790",
        id: "5",
        name: "Joan Odoi",
        email: "joanodoi12@gmail.com"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: const Text(
            "My Contacs",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/photos/attractive-businesswoman-using-a-digital-tablet-while-standing-in-of-picture-id1164863397")),
          ),
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
          itemBuilder: (context, index) => Dismissible(
                key: ValueKey(contactApp[index].id),
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete),
                ),
                onDismissed: (direction) {
                  setState(() {
                    contactApp.removeAt(index);
                  });
                },
                //secondaryBackground: Container(color: Colors.green),
                direction: DismissDirection.startToEnd,
                confirmDismiss: (direction) async {
                  var results = await showDialog(
                      context: context, builder: (context) => Delete());
                  return results;
                },
                child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ContactDetails();
                    }));
                  },
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/photos/smiling-indian-business-man-working-on-laptop-at-home-office-young-picture-id1307615661"),
                  ),
                  title: const Text(
                    "Mary Immaculate",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  subtitle: const Text("+233207885790",
                      style: TextStyle(fontSize: 15)),
                  trailing: IconButton(
                      onPressed: () {
                        // showModalBottomSheet(
                        //     // isScrollControlled: true,
                        //     context: context,
                        //     builder: (context) => Container(
                        //           height: 300,
                        //         ));
                      },
                      icon: const Icon(Icons.more_horiz)),
                ),
              ),

          //),
          separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
                height: 2,
              ),
          itemCount: contactApp.length),
    );
  }
}
