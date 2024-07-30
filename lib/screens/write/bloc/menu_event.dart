import 'package:equatable/equatable.dart';
import '../../../models/menu_model.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class AddMenu extends MenuEvent {
  final Menu menu;

  const AddMenu(this.menu);

  @override
  List<Object> get props => [menu];
}

class DeleteMenu extends MenuEvent {
  final String title;

  const DeleteMenu(this.title);

  @override
  List<Object> get props => [title];
}

class EditMenuModel extends MenuEvent {
  final String menuTitle;
  final MenuModel newModel;
  final MenuModel? oldModel;
  final String category;

  const EditMenuModel(
      this.menuTitle, this.oldModel, this.category, this.newModel);

  @override
  List<Object> get props => [menuTitle, oldModel!, category, newModel];
}

class RemoveMenuModel extends MenuEvent {
  final String menuTitle;
  final MenuModel removeModel;
  final String category;

  const RemoveMenuModel(this.menuTitle, this.removeModel, this.category);

  @override
  List<Object> get props => [menuTitle, removeModel, category];
}
