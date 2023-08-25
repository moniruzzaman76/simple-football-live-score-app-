import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final Map<String,dynamic> matchData;
  const MatchDetailsScreen({Key? key, required this.matchData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Row(
          children: [
            Text(matchData["team_name_a"],
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 10,),
            const Text("vs", style: TextStyle(
              fontSize: 20,
            ),
            ),
            const SizedBox(width: 10,),
            Text(matchData['team_name_b'],
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Card(
        elevation: 4,
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${matchData['team_name_a']} vs ${matchData['team_name_b']}",style: const TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 10,),
                Text("${matchData['team_a_score']} vs ${matchData['team_b_score']}",style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),),
                const SizedBox(height: 10,),
                Text("Time : ${matchData["runing_time"]}",style: const TextStyle(
                  fontSize: 20,
                    fontWeight: FontWeight.w500
                ),),
                const SizedBox(height: 10,),
                Text("Total Time: ${matchData["total_time"]}",style: const TextStyle(
                  fontSize: 20,
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
