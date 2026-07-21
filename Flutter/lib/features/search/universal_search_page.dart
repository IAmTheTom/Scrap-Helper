import 'package:flutter/material.dart';

import '../../data/models/productivity_models.dart';
import '../../data/repositories/search_repository.dart';

class UniversalSearchPage extends StatefulWidget {
  const UniversalSearchPage({super.key});

  @override
  State<UniversalSearchPage> createState() => _UniversalSearchPageState();
}

class _UniversalSearchPageState extends State<UniversalSearchPage> {
  final _repository = SearchRepository();
  final _controller = TextEditingController();
  Future<List<SearchResult>>? _future;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _search() {
    setState(() {
      _future = _repository.search(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Everything')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              controller: _controller,
              hintText: 'Objects, categories, loads, pickups, storage',
              leading: const Icon(Icons.search),
              trailing: [
                IconButton(
                  onPressed: _search,
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
              onSubmitted: (_) => _search(),
            ),
          ),
          Expanded(
            child: _future == null
                ? const Center(child: Text('Enter a search term.'))
                : FutureBuilder<List<SearchResult>>(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Search failed: ${snapshot.error}'),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final results = snapshot.data!;
                      if (results.isEmpty) {
                        return const Center(child: Text('No matches.'));
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          final result = results[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(result.kind.substring(0, 1)),
                              ),
                              title: Text(result.title),
                              subtitle: Text(
                                '${result.kind} • ${result.subtitle}',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
