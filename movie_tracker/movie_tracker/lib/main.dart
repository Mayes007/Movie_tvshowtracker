import 'package:flutter/material.dart';

void main() {
  runApp(const MovieTrackerApp());
}

class MovieTrackerApp extends StatelessWidget {
  const MovieTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class Movie {
  String title;
  bool watched;

  Movie({required this.title, this.watched = false});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Movie> _movies = [];
  final TextEditingController _controller = TextEditingController();

  void _addMovie() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _movies.add(Movie(title: _controller.text));
      _controller.clear();
    });
  }

  void _toggleWatched(int index) {
    setState(() {
      _movies[index].watched = !_movies[index].watched;
    });
  }

  void _deleteMovie(int index) {
    setState(() {
      _movies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🎬 Movie / TV Tracker"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Enter movie or show name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addMovie,
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(
                      movie.title,
                      style: TextStyle(
                        decoration: movie.watched
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    leading: IconButton(
                      icon: Icon(
                        movie.watched
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: movie.watched
                            ? Colors.green
                            : Colors.grey,
                      ),
                      onPressed: () => _toggleWatched(index),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteMovie(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}