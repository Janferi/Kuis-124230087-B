import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/data/game_data.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${gameList[widget.index].gameName}'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 250,
            width: double.infinity,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: Image.asset(
              gameList[widget.index].gameImg,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  gameList[widget.index].gameName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  gameList[widget.index].gamePublisher,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  gameList[widget.index].gamePublishDate,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  gameList[widget.index].totalLike.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),

                Text(
                  gameList[widget.index].gameDesc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
