
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource soucre) async{
 final ImagePicker _imagePicker = ImagePicker();
 final _file = await _imagePicker.pickImage(source: soucre);
  if(_file != null){
    print("File COme!!!");
    print(_file);
     print("File COme!!!");
    return await _file;
  }
  print("No image selected");
}