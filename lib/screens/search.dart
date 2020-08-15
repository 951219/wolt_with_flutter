import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/services/restaurant_service.dart';
import '../constants.dart' as constants;

//TODO Search page

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> nameList = RestaurantService().getRestaurantNames();
  _SearchAppBarDelegate _searchDelegate;

  @override
  void initState() {
    super.initState();
    _searchDelegate = _SearchAppBarDelegate(nameList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
              color: Colors.blue,
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                //! startSearch
                showSearchPage(context, _searchDelegate);
              },
            ),
          ),
          title: InkWell(
            onTap: () {
              //! startSearch
              showSearchPage(context, _searchDelegate);
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 240, 10),
              child: Text(
                'Search',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.blue,
                onPressed: () {
                  //! startSearch
                  showSearchPage(context, _searchDelegate);
                },
              ),
            )
          ],
        ),
        body: Center(
          child: Text(
            nameList.toString(),
          ),
        ));
  }

  void showSearchPage(
      BuildContext context, _SearchAppBarDelegate searchDelegate) async {
    final String selected =
        await showSearch<String>(context: context, delegate: searchDelegate);

    if (selected != null) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('You chose: $selected')));
    }
  }
}

class _SearchAppBarDelegate extends SearchDelegate<String> {
  final List<String> _words;

  _SearchAppBarDelegate(List<String> words)
      : _words = words,
        super();

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.backup),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You chose:'),
            GestureDetector(
                onTap: () {
                  this.close(context, this.query);
                },
                child: Text(this.query)),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions =
        _words.where((word) => word.startsWith(query));

    return _WordSuggestionList(
        query: this.query,
        suggestions: suggestions.toList(),
        onSelected: (String suggestion) {
          this.query = suggestion;
          showResults(context);
        });
  }
}

class _WordSuggestionList extends StatelessWidget {
  _WordSuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;
  final List<RestaurantObject> restaurants =
      RestaurantService().getRestaurants();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int i) {
          final String suggestion = suggestions[i];
          // List<RestaurantObject> restod = restaurants.where((element) => element.title==suggestion).toList();
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              onSelected(suggestion);
            },
          );
        });
  }
}
