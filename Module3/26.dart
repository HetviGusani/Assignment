import 'package:flutter/material.dart';

class InfiniteScrollExample extends StatefulWidget {
  const InfiniteScrollExample({super.key});

  @override
  State<InfiniteScrollExample> createState() => _InfiniteScrollExampleState();
}

class _InfiniteScrollExampleState extends State<InfiniteScrollExample> {
  List<int> items = List.generate(20, (index) => index);
  final ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      loadMoreData();
    }
  }

  Future<void> loadMoreData() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // simulate API call

    List<int> newData =
    List.generate(10, (index) => items.length + index);

    setState(() {
      items.addAll(newData);
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Infinite Scroll")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index < items.length) {
            return ListTile(
              title: Text("Item ${items[index]}"),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const SizedBox(),
              ),
            );
          }
        },
      ),
    );
  }
} 