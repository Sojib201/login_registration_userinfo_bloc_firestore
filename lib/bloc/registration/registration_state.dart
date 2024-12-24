import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {}

class InitialStep extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class DropDownLoadedState extends RegistrationState {
  final List<String> dropdownlist;
  final String? selectedItem;

  DropDownLoadedState(this.dropdownlist, this.selectedItem);

  @override
  List<Object?> get props => [dropdownlist, selectedItem];
}

// class DropdownSelected extends RegistrationState {
//   final String selectedItem;
//   DropdownSelected({required this.selectedItem});
//   @override
//   List<Object?> get props => [selectedItem];
// }
