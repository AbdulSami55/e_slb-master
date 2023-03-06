import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/Bloc/User/userState.dart';
import 'package:flutter_complete_guide/models/UserModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(UserState(
            islisence: false,
            isDyslexic: false,
            securityWarning: false,
            ofaWarning: false,
            isWarning: false,
            font: ''));

  setUser(UserModel userModel) {
    state.userModel = userModel;
  }

  setIsLisence(bool islisence) {
    emit(state.copywith(islisence: islisence));
  }

  setImage(XFile image) {
    emit(state.copywith(img: image));
  }

  setIsDyslexic(bool isDyslexic) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('dyslexic', isDyslexic);
    if (isDyslexic) {
      setFont("OpenDyslexic");
    } else {
      setFont("OpenSans");
    }

    emit(state.copywith(isDyslexic: isDyslexic));
  }

  setSecurityWarning(bool warn) {
    emit(state.copywith(securityWarning: warn));
  }

  setOfaWarning(bool warn) {
    emit(state.copywith(ofaWarning: warn));
  }

  setWarning(bool warn) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('warn', warn);
    emit(state.copywith(isWarning: warn));
  }

  setFont(String font) async {
    emit(state.copywith(font: font));
  }

  setPosition(Position position) {
    emit(state.copywith(position: position));
  }
}
