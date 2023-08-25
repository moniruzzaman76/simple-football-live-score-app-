import 'package:cloud_firestore/cloud_firestore.dart';

class Match {
  final String teamA;
  final String teamB;
  final int goalsTeamA;
  final int goalsTeamB;
  final String runningTime;
  final int totalMinutes;

  Match({
    required this.teamA,
    required this.teamB,
    required this.goalsTeamA,
    required this.goalsTeamB,
     required this.runningTime,
    required this.totalMinutes,
  });

  factory Match.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Match(
      teamA: snapshot.data()['team_name_a'],
      teamB: snapshot.data()['team_name_b'],
      goalsTeamA: snapshot.data()['team_a_score'],
      goalsTeamB: snapshot.data()['team_b_score'],
      runningTime: snapshot.data()["runing_time"],
      totalMinutes: snapshot.data()['total_time'],
    );
  }
}
