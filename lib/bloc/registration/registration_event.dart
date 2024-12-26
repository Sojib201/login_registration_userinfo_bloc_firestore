import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {}

class LoadDropDownList extends RegistrationEvent {
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

class PerformRegistration extends RegistrationEvent {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String age;
  final String userType;

  PerformRegistration(this.email, this.password, this.name, this.phone, this.age,
      this.userType);

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
