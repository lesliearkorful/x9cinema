import 'package:flutter/material.dart' show Color;

class Movie {
  String title;
  String director;
  String poster;
  Color accentColor;
  Duration duration;
  String category;
  String synopsis;

  Movie({
    this.accentColor,
    this.director,
    this.poster,
    this.title,
    this.category,
    this.duration,
    this.synopsis,
  });
}
