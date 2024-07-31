import 'package:equatable/equatable.dart';

import '../../../../models/menu_model.dart';

abstract class MenuModelEvent extends Equatable {
  const MenuModelEvent();

  @override
  List<Object> get props => [];
}

class UpdateTitle extends MenuModelEvent {
  final String newTitle;

  const UpdateTitle(this.newTitle);

  @override
  List<Object> get props => [newTitle];
}

class AddCategory extends MenuModelEvent {
  final String category;

  const AddCategory(this.category);

  @override
  List<Object> get props => [category];
}

class RemoveCategory extends MenuModelEvent {
  final String category;

  const RemoveCategory(this.category);

  @override
  List<Object> get props => [category];
}

class AddMenuItem extends MenuModelEvent {
  final MenuModel item;
  final String category;

  const AddMenuItem(this.item, this.category);

  @override
  List<Object> get props => [item, category];
}

class EditMenuItem extends MenuModelEvent {
  final MenuModel oldItem;
  final MenuModel newItem;
  final String category;

  const EditMenuItem(this.oldItem, this.newItem, this.category);

  @override
  List<Object> get props => [oldItem, newItem, category];
}

class RemoveMenuItem extends MenuModelEvent {
  final MenuModel item;
  final String category;

  const RemoveMenuItem(this.item, this.category);

  @override
  List<Object> get props => [item, category];
}
