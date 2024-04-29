import 'dart:typed_data';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class PostItem{
  PostItem( { required this.id,required this.title, required this.caption, required this.image, required this.date});
  // DateTime.now();

  final String id;
  final String title;
  final String caption;
  final Uint8List image;
  final String date;
}