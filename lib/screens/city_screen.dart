import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: TextField(
              onChanged: (query) => {print(query)},
              // controller: _searchController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.0),
                filled: true,
                icon: Icon(
                  Icons.location_city,
                  color: Colors.black,
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter city name...',
                hintStyle: TextStyle(
                    color: Color.fromRGBO(204, 204, 204, 1), fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
