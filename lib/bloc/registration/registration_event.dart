import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {}

class RegistrationData extends RegistrationEvent {
  @override
  List<Object?> get props => [];
}

class LoadDropDownList extends RegistrationEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class DropdownItemSelected extends RegistrationEvent {

  final String itemSelect;
  DropdownItemSelected(this.itemSelect);

  @override
  List<Object?> get props => [itemSelect];
}
