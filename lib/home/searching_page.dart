import 'package:flutter/material.dart';
import 'package:name_similarity/home/home_page.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController countryResult = TextEditingController();

  @override
  void dispose() {
    countryResult.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Search your name',
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFormField(
              controller: countryResult,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(
                      name: countryResult.text,
                    ),
                  ),
                  (route) => false);
            },
            child: Icon(Icons.done),
          )
        ],
      ),
    );
  }
}