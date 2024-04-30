
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource soucre) async{
 final ImagePicker _imagePicker = ImagePicker();
 XFile? _file = await _imagePicker.pickImage(source: soucre);
  if(_file != null){
    return await _file.readAsBytes();
  }
  print("No image selected");
}