import 'package:flutter/material.dart';
import 'package:x9cinema/models/Movie.dart';
import 'package:x9cinema/ui/home/HomeSection.dart';
import 'package:x9cinema/util/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double moviesOpacity = 0;
  double seriesOpacity = 0;
  final fadeDuration = Duration(milliseconds: 200);
  String selectedPlatform = "Recommended";
  List<String> platforms = [
    "Recommended",
    "Netflix",
    "HBOGO",
    "Amazon",
    "Disney+",
  ];
  Widget get menuButton {
    final color = Theme.of(context).iconTheme.color;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(height: 3, width: 24, color: color),
          SizedBox(height: 7),
          Container(height: 3, width: 12, color: color),
        ],
      ),
    );
  }

  Widget get searchButton {
    final color = Theme.of(context).iconTheme.color;
    return Container(
      width: 22,
      height: 22,
      child: Stack(
        children: <Widget>[
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 3),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()..rotateZ(-40),
              child: Container(height: 3, width: 7, color: color),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    final tempPlatforms = List<String>.from(platforms);
    platforms.clear();
    super.initState();
    Future.delayed(Duration(milliseconds: 600), () async {
      await populatePlatforms(tempPlatforms);
      fadeInWidgets();
    });
  }

  Future<void> populatePlatforms(List<String> list) async {
    for (String platform in list) {
      await Future.delayed(Duration(milliseconds: 200), () {
        if (mounted) setState(() => platforms.add(platform));
      });
    }
  }

  void fadeInWidgets() async {
    await Future.delayed(Duration(milliseconds: 400));
    if (mounted) setState(() => moviesOpacity = 1);
    await Future.delayed(Duration(milliseconds: 400));
    if (mounted) setState(() => seriesOpacity = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text.rich(
            TextSpan(
              text: "X9",
              style: TextStyle(fontWeight: FontWeight.w900),
              children: [
                TextSpan(
                  text: "CINEMA",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(icon: searchButton, onPressed: () {}),
          IconButton(icon: menuButton, onPressed: () {}),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 90,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90),
                  ...platforms.map((option) {
                    bool active = option == selectedPlatform;
                    // final textColor = active ? Colors.white : Colors.black;
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: active
                            ? [
                                BoxShadow(
                                  color: UIColors.pink.withOpacity(0.4),
                                  offset: Offset(0, 20),
                                  blurRadius: 26,
                                  spreadRadius: -15,
                                )
                              ]
                            : null,
                      ),
                      child: ChoiceChip(
                        selected: active,
                        // showCheckmark: false,
                        label: Text(option),
                        onSelected: (s) {
                          setState(() => selectedPlatform = option);
                        },
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            duration: fadeDuration,
            opacity: moviesOpacity,
            child: HomeSection(
              title: "Movies",
              movies: <Movie>[
                Movie(
                  title: "DRIVE",
                  director: "Ryan Gosling",
                  accentColor: Color(0xFF09bbcb),
                  synopsis: "This action drama follows a mysterious man who has multiple jobs as a garage mechanic, a Hollywood stuntman and a getaway driver seems to be trying to escape his shady past as he falls for his neighbor - whose husband is in prison and who's looking after her child alone. Meanwhile, his garage mechanic boss is trying to set up a race team using gangland money, which implicates our driver as he is to be used as the race team's main driver. Our hero gets more than he bargained for when he meets the man who is married to the woman he loves.",
                  poster: "https://i.pinimg.com/736x/c8/d4/0a/c8d40a746ed5509e17951f499391c8db--ryan-gosling-mike-mitchell.jpg",
                ),
                Movie(
                  title: "Mad Max: Fury Road",
                  director: "Tom Hardy",
                  accentColor: Color(0xFFfcc10d),
                  synopsis: "An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and almost everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order. There's Max, a man of action and a man of few words, who seeks peace of mind following the loss of his wife and child in the aftermath of the chaos. And Furiosa, a woman of action and a woman who believes her path to survival may be achieved if she can make it across the desert back to her childhood homeland.",
                  poster: "https://www.outerplaces.com/images/user_upload/mike-mitchell.jpg",
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            duration: fadeDuration,
            opacity: seriesOpacity,
            child: HomeSection(
              title: "Series",
              movies: <Movie>[
                Movie(
                  title: "The Passage",
                  director: "Saniyya Sidney",
                  accentColor: Color(0xFFfcc10d),
                  synopsis: "When a botched U.S. government experiment turns a group of death row inmates into highly infectious vampires, an orphan girl might be the only person able to stop the ensuing crisis.",
                  poster: "https://assets.foxdcg.com/dpp-uploaded/images/the-passage/keyart_s1.jpg",
                ),
                Movie(
                  title: "TIMELESS",
                  director: "Abigail Spencer",
                  accentColor: Color(0xFF09bbcb),
                  synopsis: "Timeless tells the story of a mysterious criminal who steals a secret state-of-the-art time machine, intent on destroying America as we know it by changing the past. The only hope is an unexpected team: a scientist, a soldier and a history professor, who must use the machine's prototype to travel back in time to critical events. While they must make every effort not to affect the past themselves, they must also stay one step ahead of this dangerous fugitive. But can this handpicked team uncover the mystery behind it all and end his destruction before it's too late?",
                  poster: "https://img.cinemablend.com/filter:scale/quill/2/6/5/4/4/8/265448114f232b767afda494c0bad1092aa9be85.jpg?mw=600",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
