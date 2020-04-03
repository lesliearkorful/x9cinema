import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:x9cinema/models/Movie.dart';
import 'package:x9cinema/ui/movie/MovieDetail.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  const HomeSection({this.movies = const <Movie>[], this.title});

  Widget card(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            maintainState: true,
            opaque: false,
            pageBuilder: (_, __, ___) {
              return MovieDetail(tag: movie.title, movie: movie);
            },
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (_, animation, __, child) {
              final tween = Tween<double>(begin: 0.0, end: 1.0).chain(
                CurveTween(curve: Curves.ease),
              );
              return FadeTransition(
                opacity: tween.animate(animation),
                child: child,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: movie.title,
        transitionOnUserGestures: true,
        child: Container(
          width: 300,
          height: 400,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(right: 30),
          padding: EdgeInsets.fromLTRB(30, 5, 20, 30),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(36),
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(movie.poster),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.05),
                BlendMode.multiply,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: movie.accentColor.withOpacity(0.3),
                offset: Offset(0, 30),
                blurRadius: 30,
                spreadRadius: -15,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    iconSize: 36,
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    icon: Icon(CupertinoIcons.ellipsis),
                    onPressed: () {},
                  ),
                ),
                Spacer(),
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  movie.director,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star_half),
                      Spacer(),
                      Icon(Icons.bookmark, size: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 450,
          width: double.infinity,
          margin: EdgeInsets.only(top: 15, bottom: 10),
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 450),
                ...movies.map((m) => card(context, m)).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
