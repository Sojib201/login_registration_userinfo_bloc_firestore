import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_registration_userinfo_bloc_firebase/bloc/registration/registration_event.dart';
import 'package:login_registration_userinfo_bloc_firebase/bloc/registration/registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  List<String> item = ['Supervisor', 'Representitive', 'ZM'];

  String? selectedItem;

  RegistrationBloc() : super(InitialStep()) {
    on<LoadDropDownList>((event, emit) {
      emit(DropDownLoadedState(item, selectedItem));
    });

    on<DropdownItemSelected>((event, emit) {
      selectedItem = event.itemSelect;

      emit(DropDownLoadedState(item, selectedItem));
    });
  }
}
