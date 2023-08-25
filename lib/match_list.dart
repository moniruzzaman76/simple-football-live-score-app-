import 'package:flutter/material.dart';
import 'match_number_two.dart';
import 'match_number_one.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text('Match List',style: TextStyle(
          color: Colors.white,
          fontSize: 25
        ),),
      ),
      body: Column(
        children: [
          ListTile(
              title: const Text('Argentina vs Africa',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ArgentinaVsAfrica();
                  }));
                },
                icon: const Icon(Icons.arrow_forward),
              )),
          ListTile(
              title: const Text('Italy vs Spain',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ItalyVsSpain();
                  }));
                },
                icon: const Icon(Icons.arrow_forward),
              )),
        ],
      ),
    );
  }
}