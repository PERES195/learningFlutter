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
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: Card(
        elevation: 15,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints.expand(),
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
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,)),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                          height: 1.5),
                    ),
                  ),
                  const Divider(
                    color: Colors.black54,
                    thickness: 2.0,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Suggested Comics: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
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
                                    fontSize: 16,
                                    height: 1.5),
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
        ),
      ),
    );
  }
}
