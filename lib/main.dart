// ignore_for_file: prefer_const_constructors

import 'package:destiny/story_Brain.dart';
import 'package:flutter/material.dart';
import 'package:destiny/story.dart';

void main() => runApp(Destiny());

class Destiny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destiny"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/backgroundimg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          storyBrain.getStory(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        storyBrain.getChoice1(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            storyBrain.nextStory(2);
                          });
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          storyBrain.getChoice2(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
