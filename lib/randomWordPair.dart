import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandonWordPair extends StatefulWidget {
  @override
  RandonWordPairState createState() => RandonWordPairState();
}


class RandonWordPairState extends State<RandonWordPair> {

  final randomWordPairs = <WordPair>[];
  final savedWordPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if(index >= randomWordPairs.length) {
          randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(randomWordPairs[index]);
      },
    );
  }


  Widget _buildRow(WordPair wordPair) {

    final alreadySaved = savedWordPairs.contains(wordPair);

    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: TextStyle(
          fontSize: 18
      ),
    ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved? Colors.red: null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            savedWordPairs.remove(wordPair);
          } else {
            savedWordPairs.add(wordPair);
          }
        });
      },
    );
  }


  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WordPair Generator',
          style: TextStyle(
              fontFamily: 'SigmarOne',   //  as in the pubspec.yaml
              fontSize: 20,
              fontWeight: FontWeight.normal,
              letterSpacing: 4,
              color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: viewSavedWordPairs,
          )
        ],
      ),
      body: _buildList(),
    );
  }

  void viewSavedWordPairs() {
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {

          }
        )
    )
  }
}