import 'package:flutter/material.dart';

class CharacterPage extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final List<String> comics;

  const CharacterPage({
    required this.name,
    required this.description,
    required this.image,
    required this.comics,
  });

  @override
  Widget build(BuildContext context) {
    return _createScaffold();
  }

  Scaffold _createScaffold() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    text: TextSpan(
                        text: name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    image,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16.0, fontStyle: FontStyle.italic),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Suggested Comics: ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.underline,),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: comics.map((comic) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(children: [
                        const Text(
                          "\u2022",
                          style: TextStyle(fontSize: 16),
                        ),
                        //bullet text
                        const SizedBox(
                          width: 10,
                        ),
                        //space between bullet and text
                        Expanded(
                          child: Text(
                            comic,
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'Avenir Next'),
                          ), //text
                        )
                      ]),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
