import 'dart:typed_data';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class PostItem{
  PostItem( { required this.id,required this.title, required this.caption, required this.imageUrl, required this.date});
  // DateTime.now();

  final String id;
  final String title;
  final String caption;
  final String imageUrl;
  final String date;
}