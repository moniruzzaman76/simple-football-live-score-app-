import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArgentinaVsAfrica extends StatelessWidget {
  const ArgentinaVsAfrica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Row(
          children: [
            Text("Argentina",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(width: 10,),
            Text("vs", style: TextStyle(
              fontSize: 20,
            ),
            ),
            SizedBox(width: 10,),
            Text("Africa",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection('football live score')
                  .doc('xDeM8sjy7wmQkKRg6hiQ').snapshots(),
              builder:
                  (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const Text("Document does not exist");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final score = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "${score.get('team_name_a')} vs ${score["team_name_b"]}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                              )
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              "${score.get('team_a_score')} : ${score.get('team_b_score')}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                )
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              "Time : ${score.get('runing_time')}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                )
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              "Total Time : ${score.get('total_time')}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}