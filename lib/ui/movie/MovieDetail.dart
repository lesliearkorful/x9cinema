import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:x9cinema/models/Movie.dart';
import 'package:x9cinema/util/colors.dart';

class MovieDetail extends StatefulWidget {
  final String tag;
  final Movie movie;
  MovieDetail({this.movie, this.tag});

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Movie get movie => widget.movie;
  double synopsisOpacity = 0;
  final fadeDuration = Duration(milliseconds: 150);
  final divider = Container(color: Colors.grey.shade300, height: 1, width: 40);
  final borderRadius = BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
  );

  List<String> cast = [
    "https://www.biography.com/.image/t_share/MTE5NTU2MzE2NjUyOTk2MTA3/9th-annual-ves-awards---red-carpet.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/e/e5/Charlize_Theron_Cannes_2015_2.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSvS5ZIyqAR79Tmt1h_vc72LbhodPH5cwa6B6mIY8zfHAvYdMk2&usqp=CAU",
    "https://upload.wikimedia.org/wikipedia/commons/5/50/Zoe_Kravitz_March_18%2C_2014_%28cropped%29.jpg",
    "https://media.glamour.com/photos/5e4ee9e90494850008682a23/16:9/w_2560%2Cc_limit/lede_social.jpg",
  ];

  Widget heading(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  @override
  void initState() {
    final tempCast = List<String>.from(cast);
    cast.clear();
    super.initState();
    Future.delayed(Duration(milliseconds: 600), () async {
      await fadeInWidgets();
      populatePlatforms(tempCast);
    });
  }

  void populatePlatforms(List<String> list) async {
    for (String c in list) {
      await Future.delayed(Duration(milliseconds: 200), () {
        if (mounted) setState(() => cast.add(c));
      });
    }
  }

  Future<void> fadeInWidgets() async {
    await Future.delayed(Duration(milliseconds: 300));
    if (mounted) setState(() => synopsisOpacity = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(movie.title.toUpperCase()),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.tag,
              transitionOnUserGestures: true,
              child: Container(
                height: 310,
                margin: EdgeInsets.fromLTRB(24, 10, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(movie.poster),
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.03),
                      BlendMode.multiply,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: movie.accentColor.withOpacity(0.2),
                      offset: Offset(0, 30),
                      blurRadius: 30,
                      spreadRadius: -15,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 7,
                                  width: 30,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Container(
                                  height: 7,
                                  width: 7,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Container(
                                  height: 7,
                                  width: 7,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star_half),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Theme.of(context).dialogBackgroundColor,
                        borderRadius: borderRadius,
                      ),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.body1.color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("1h 58m"),
                            divider,
                            Text("Action"),
                            divider,
                            Text("4.5"),
                            divider,
                            Icon(Icons.bookmark),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            AnimatedOpacity(
              opacity: synopsisOpacity,
              duration: fadeDuration,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    heading("Synopsis"),
                    SizedBox(height: 10),
                    Text(
                      movie.synopsis ?? "",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle.color,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 30),
                    heading("Cast"),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 120),
                  ...cast.map((c) {
                    return Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: UIColors.grey,
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(c),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 30),
                            blurRadius: 30,
                            spreadRadius: -15,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
