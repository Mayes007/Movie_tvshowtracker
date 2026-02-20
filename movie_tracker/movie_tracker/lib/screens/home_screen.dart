import 'package:flutter/material.dart';

class Media {
  final String title;
  final String type; // "movie" or "tv"

  Media({required this.title, required this.type});
}

// Example media list
List<Media> mediaList = [
  Media(title: "Inception", type: "movie"),
  Media(title: "Interstellar", type: "movie"),
  Media(title: "Breaking Bad", type: "tv"),
  Media(title: "Stranger Things", type: "tv"),
];

List<Media> filteredList(String type) {
  return mediaList.where((m) => m.type == type).toList();
}

Widget buildList(String type) {
  final list = filteredList(type);
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(list[index].title),
      );
    },
  );
}

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("🎬 Tracker"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Movies"),
              Tab(text: "TV Shows"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildList("movie"),
            buildList("tv"),
          ],
        ),
      ),
    );
  }
}