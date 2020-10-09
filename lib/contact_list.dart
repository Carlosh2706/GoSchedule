import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_database/models/brew.dart';
import 'package:startup_database/contact_tile.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context) ?? [];

    brews.forEach((brew) { 
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
    });

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return ContactTile(brew: brews[index]);
      },
    );
  }
}
