import 'package:flutter/material.dart';
import 'package:places_app/pages/placesDetail_page.dart';
import 'package:places_app/providers/greatPlaces.dart';
import 'package:provider/provider.dart';

import '../pages/addPlace_page.dart';

class PlacesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesPage.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                    ? const Center(
                        child: Text('Got no places yet, start adding some!'),
                      )
                    : ListView.builder(
                        itemCount: greatPlaces.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.items[i].image,
                            ),
                          ),
                          title: Text(
                            greatPlaces.items[i].title,
                          ),
                          subtitle: Text(
                              greatPlaces.items[i].location!.address as String),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              PlaceDetailPage.routeName,
                              arguments: greatPlaces.items[i].id,
                            );
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
