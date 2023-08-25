import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/match_details_screen.dart';
import 'package:flutter/material.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Match List",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.
        collection("football live score").doc("xDeM8sjy7wmQkKRg6hiQ").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String,dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Center(child: Text("No data available"));
          }

          final data = snapshot.data!.data()!;

          return ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MatchDetailsScreen(matchData: data)));
            },
            title: Row(
              children: [
                Text(
                  data["team_name_a"],
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(width: 15,),
                const Text("vs", style: TextStyle(
                  fontSize: 25,
                )),
                const SizedBox(width: 15,),
                Text(
                  data["team_name_b"],
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward),
          );

        },
      ),
    );
  }
}

