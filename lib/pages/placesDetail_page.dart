import 'package:flutter/material.dart';
import 'package:places_app/models/place.dart';
import 'package:places_app/pages/map_page.dart';
import 'package:provider/provider.dart';

import '../providers/greatPlaces.dart';

class PlaceDetailPage extends StatelessWidget {
  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id as String);
    final selectedPlaceLocation = PlaceLocation(
        latitude: selectedPlace.location!.latitude,
        longitude: selectedPlace.location!.longitude);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.file(
            selectedPlace.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          selectedPlace.location!.address as String,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapPage(
                        initialLocation: selectedPlaceLocation,
                        isSelecting: false,
                      )),
            );
          },
          child: Text('View on Map'),
          textColor: Theme.of(context).primaryColor,
        )
      ]),
    );
  }
}
