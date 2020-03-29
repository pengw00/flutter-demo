import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'auth.dart';
import 'posts.dart';
// import 'account.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Center(
        child: Center(child: RandomWords()),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> implements AuthStateListener {
  BuildContext _ctx;
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  RandomWordsState() {
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  onAuthStateChanged(AuthState state) {
    if (state == AuthState.LOGGED_OUT) print('fdfd');
    // Navigator.of(_ctx).pushReplacementNamed('/login');
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  void _tabPosts() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Posts Lists'),
            ),
            body: PostsFetchData(),
          );
        },
      ),
    );
  }

  void _loginRoute() {
    Navigator.of(_ctx).pushReplacementNamed('/account');
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        leading: IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.playlist_play), onPressed: _tabPosts),
          IconButton(icon: Icon(Icons.pages), onPressed: _pushSaved),
          IconButton(icon: Icon(Icons.account_box), onPressed: _loginRoute),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
