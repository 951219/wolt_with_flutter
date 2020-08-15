import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/restaurantcards/smallest_restaurant_card.dart';
import 'package:wolt_with_flutter/services/category_service.dart';
import 'package:wolt_with_flutter/services/restaurant_service.dart';
import 'package:wolt_with_flutter/widgets/order_again.dart';
import '../constants.dart' as constants;

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
                showSearchPage(context, _searchDelegate);
              },
            ),
          ),
          title: InkWell(
            onTap: () {
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
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 20),
          Center(
            child: Wrap(
                alignment: WrapAlignment.center,
                children: CategoryService().getCategories().map((object) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.blue[400],
                      textColor: Colors.white,
                      onPressed: () => {
                        //TODO implement tag based search
                        showSearchPage(context, _searchDelegate)
                      },
                      child: Text(
                        object.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }).toList()),
          ),
          Padding(
            padding: constants.PADDING_LTRB,
            child: Text(
              'My recent orders',
              style: constants.TITLE_STYLE,
            ),
          ),
          Center(
              child: HistoryOrders(
                  howMany: 5, showDeliveryPrice: true, addBottomLine: true)),
        ]));
  }

  void showSearchPage(
      BuildContext context, _SearchAppBarDelegate searchDelegate) async {
    await showSearch<String>(context: context, delegate: searchDelegate);
  }
}

class _SearchAppBarDelegate extends SearchDelegate<String> {
  final List<String> _words;

  _SearchAppBarDelegate(List<String> words) : _words = words;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              this.close(context, null);
            } else {
              query = '';
              showSuggestions(context);
            }
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Icon(Icons.arrow_back),
      ),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions =
        _words.where((word) => word.contains(query));

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
          List<RestaurantObject> restod = restaurants
              .where((element) => (element.title.toLowerCase())
                  .contains(suggestion.toLowerCase()))
              .toList();
          return InkWell(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                  child: SmallestRestaurantCard(
                      restoObject: restod[0], showDeliveryPrice: true),
                ),
                Divider(
                  endIndent: 20,
                  indent: 90,
                  height: 1,
                  thickness: 1,
                ),
              ],
            ),
          );
        });
  }
}
