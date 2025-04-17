import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  RecommendationCubit() : super(RecommendationState());

  String? showphoto;

  setSelectedOptionsRoom(String? selectedOptionsRoom) {
    emit(state.copyWith(selectedOptionsRoom: selectedOptionsRoom));
  }


Future<void> getOptionsRoom() async {
  final List<String> optionsRoom = ["Living Room", "Bedroom", "Kitchen", "Bathroom", "Office", "Other"];
  emit(state.copyWith(optionsRoom: optionsRoom));
}

  Future<void> takePhotoFromGallery() async {
    final pickedFile = await takePhoto(ImageSource.gallery);
    showphoto = pickedFile?.last;
    emit(state.copyWith(image: pickedFile?.first));
  }

  Future<void> takePhotoFromCamera() async {
    final pickedFile = await takePhoto(ImageSource.camera);
        showphoto = pickedFile?.last;

    emit(state.copyWith(image: pickedFile?.first));
  }
}

Future<List<String>?> takePhoto(ImageSource source) async {
  if (source == ImageSource.camera) {
    if (!await Permission.camera.request().isGranted) {
      return null;
    }
  } else if (source == ImageSource.gallery) {
    if (!await Permission.photos.request().isGranted &&
        !await Permission.storage.request().isGranted) {
      return null;
    }
  }

  final pickedFile = await ImagePicker().pickImage(source: source);

  if (pickedFile != null) {
   String  showphoto = pickedFile.path;
    final fileName = pickedFile.path.split('/').last;
    return [fileName,showphoto];
  } else {
    return null;
  }
}
