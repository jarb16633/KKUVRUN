import 'package:flutter/material.dart';
import 'package:strava/db/db.dart';
import 'package:strava/model/entry.dart';
import 'package:strava/pages/maps.dart';

import 'package:strava/widgets/entry_card.dart';

class RunPage extends StatefulWidget {
  RunPage({Key? key}) : super(key: key);

  @override
  RunPageState createState() => RunPageState();
}

class RunPageState extends State<RunPage> {
  late List<Entry> data;
  List<EntryCard> cards = [];

  void initState() {
    super.initState();
    DB.init().then((value) => fetchEntries());
  }

  void fetchEntries() async {
    cards = [];
    List<Map<String, dynamic>> _results = await DB.query(Entry.table);
    data = _results.map((item) => Entry.fromMap(item)).toList();
    data.forEach((element) => cards.add(EntryCard(entry: element)));

    if (mounted) setState(() {});
  }

  void addEntries(Entry en) async {
    DB.insert(Entry.table, en);
    fetchEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: cards,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MapPage()))
              .then((value) => addEntries(value)),
          tooltip: 'Increment',
          child: Icon(Icons.directions_run),
        ));
  }
}
