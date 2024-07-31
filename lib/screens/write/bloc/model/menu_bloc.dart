import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/menu_model.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuModelBloc extends Bloc<MenuModelEvent, MenuModelState> {
  MenuModelBloc(Menu initialMenu) : super(MenuModelState(menu: initialMenu)) {
    on<UpdateTitle>(_onUpdateTitle);
    on<AddCategory>(_onAddCategory);
    on<RemoveCategory>(_onRemoveCategory);
    on<AddMenuItem>(_onAddMenuItem);
    on<EditMenuItem>(_onEditMenuItem);
    on<RemoveMenuItem>(_onRemoveMenuItem);
  }

  void _onUpdateTitle(UpdateTitle event, Emitter<MenuModelState> emit) {
    emit(state.copyWith(menu: state.menu.copyWith(title: event.newTitle)));
  }

  void _onAddCategory(AddCategory event, Emitter<MenuModelState> emit) {
    if (!state.menu.categories.contains(event.category)) {
      final updatedCategories = List<String>.from(state.menu.categories)
        ..add(event.category);
      emit(state.copyWith(
          menu: state.menu.copyWith(categories: updatedCategories)));
    }
  }

  void _onRemoveCategory(RemoveCategory event, Emitter<MenuModelState> emit) {
    final updatedCategories = List<String>.from(state.menu.categories)
      ..remove(event.category);
    final updatedItems = Map<String, List<MenuModel>>.from(state.menu.map)
      ..remove(event.category);
    emit(state.copyWith(
        menu: state.menu
            .copyWith(categories: updatedCategories, map: updatedItems)));
  }

  void _onAddMenuItem(AddMenuItem event, Emitter<MenuModelState> emit) {
    final updatedItems = state.menu.map;
    final categories = state.menu.categories;
    if (!updatedItems.containsKey(event.category)) {
      updatedItems[event.category] = [];
    }
    if (!state.menu.categories.contains(event.category)) {
      categories.add(event.category);
    }
    updatedItems[event.category]!.add(event.item);

    emit(state.copyWith(
        menu: state.menu.copyWith(map: updatedItems, categories: categories)));
  }

  void _onEditMenuItem(EditMenuItem event, Emitter<MenuModelState> emit) {
    final updatedItems = Map<String, List<MenuModel>>.from(state.menu.map);
    final categoryItems = updatedItems[event.category];

    if (categoryItems != null) {
      final index = categoryItems.indexWhere((item) => item == event.oldItem);
      categoryItems.removeAt(index);
      if (event.newItem.category == event.oldItem.category) {
        categoryItems.insert(index, event.newItem);
        emit(state.copyWith(menu: state.menu.copyWith(map: updatedItems)));
      } else {
        final categories = state.menu.categories;
        if (!updatedItems.containsKey(event.category)) {
          updatedItems[event.category] = [];
        }
        if (!state.menu.categories.contains(event.category)) {
          categories.add(event.category);
        }
        updatedItems[event.category]!.add(event.newItem);

        emit(state.copyWith(
            menu: state.menu
                .copyWith(map: updatedItems, categories: categories)));
      }
    }
  }

  void _onRemoveMenuItem(RemoveMenuItem event, Emitter<MenuModelState> emit) {
    final updatedItems = state.menu.map;
    final categoryItems = updatedItems[event.category];
    final categories = state.menu.categories;
    if (categoryItems != null) {
      categoryItems.removeWhere((item) => item == event.item);
      if (categoryItems.isEmpty) {
        updatedItems.remove(event.category);
        categories.remove(event.category);
      }
      emit(state.copyWith(
          menu:
              state.menu.copyWith(map: updatedItems, categories: categories)));
    }
  }
}
