import 'package:flutter/material.dart';
import 'package:places_app/pages/addPlace_page.dart';
import 'package:places_app/pages/placesDetail_page.dart';
import 'package:provider/provider.dart';

import './pages/placesList_page.dart';
import './providers/greatPlaces.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListPage(),
        routes: {
          AddPlacesPage.routeName: (ctx) => AddPlacesPage(),
          PlaceDetailPage.routeName: (ctx) => PlaceDetailPage(),
        },
      ),
    );
  }
}
