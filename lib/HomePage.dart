import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String firstName = "";
  String secondName = "";

  Map<String, String> data = {
    "f": "You Are a Good Friend😊 To Him/Her",
    "l": "You Are a Nice Lover💙 To Him/Her",
    "a": "You Have a Good Affection🥰 To Him/Her",
    "m": "You Are a Wonderful Life Partner🎉 To Him/Her",
    "e": "You Are a Equal Enemy😈 To Him/Her",
    "s": "You Are a Nice Sibling💞 To Him/Her",
  };

  String calculateFlames(String name1, String name2) {
    // Convert names to lowercase and remove spaces
    name1 = name1.toLowerCase().replaceAll(' ', '');
    name2 = name2.toLowerCase().replaceAll(' ', '');

    // Create lists of characters for both names
    List<String> chars1 = name1.split('');
    List<String> chars2 = name2.split('');

    // Remove common characters
    chars1.removeWhere((char) => chars2.contains(char));
    chars2.removeWhere((char) => chars1.contains(char));

    // Calculate the total number of unique remaining characters
    int totalChars = chars1.length + chars2.length;
    print(totalChars);

    // Define the FLAMES acronym
    List<String> flames = ['f', 'l', 'a', 'm', 'e', 's'];

    // Calculate the result index
    int resultIndex = (totalChars % flames.length)-1;
    if (resultIndex < 0) {
      resultIndex = flames.length - 1;
    }

    // Return the result based on the result index
    return flames[resultIndex];
  }


  var _firstNameCotroller = TextEditingController();
  var _secondNameCotroller = TextEditingController();

  void findRelation() {
    String relation = calculateFlames(firstName, secondName);
    String? message = data[relation];
    if (message != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Your Relationship"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        title: const Text(
          "Flames ❤️",
          style: TextStyle(color: Colors.white, fontFamily: 'tiltneon'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            height: 600,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image(
                    image: AssetImage('assets/Images/h2.webp'),
                    width: 250,
                    height: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _firstNameCotroller,
                    onChanged: (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Enter First Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _secondNameCotroller,
                    onChanged: (value) {
                      setState(() {
                        secondName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Enter Second Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          findRelation();
                        },
                        child: const Text(
                          "Find My Relationship",
                          style: TextStyle(fontSize: 12, fontFamily: 'tiltneon'),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: IconButton(
                          onPressed: () {
                            _firstNameCotroller.text='';
                            _secondNameCotroller.text='';
                          },
                          icon: Icon(Icons.delete),
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Homepage(),
//   ));
// }
