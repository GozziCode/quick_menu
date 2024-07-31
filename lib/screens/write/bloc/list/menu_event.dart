import 'package:equatable/equatable.dart';

import '../../../../models/menu_model.dart';

abstract class MenuListEvent extends Equatable {
  const MenuListEvent();

  @override
  List<Object> get props => [];
}

class AddMenu extends MenuListEvent {
  final Menu menu;

  const AddMenu(this.menu);

  @override
  List<Object> get props => [menu];
}

class DeleteMenu extends MenuListEvent {
  final String title;

  const DeleteMenu(this.title);

  @override
  List<Object> get props => [title];
}
