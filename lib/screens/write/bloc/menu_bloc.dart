import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/menu_model.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuState(menus: [])) {
    on<AddMenu>(_onAddMenu);
    on<DeleteMenu>(_onDeleteMenu);
    on<EditMenuModel>(_onEditMenuModel);
    on<RemoveMenuModel>(_onRemoveMenuModel);
  }

  void _onAddMenu(AddMenu event, Emitter<MenuState> emit) {
    final updatedMenus = List<Menu>.from(state.menus)..add(event.menu);
    emit(state.copyWith(menus: updatedMenus));
  }

  void _onDeleteMenu(DeleteMenu event, Emitter<MenuState> emit) {
    final updatedMenus =
        state.menus.where((menu) => menu.title != event.title).toList();
    emit(state.copyWith(menus: updatedMenus));
  }

  void _onEditMenuModel(EditMenuModel event, Emitter<MenuState> emit) {
    final updatedMenus = state.menus.map((menu) {
      if (menu.title == event.menuTitle) {
        final categoryModels = menu.map[event.oldModel?.category] ?? [];
        final modelIndex = categoryModels
            .indexWhere((model) => model.name == event.oldModel?.name);

        if (modelIndex != -1) {
          categoryModels[modelIndex] = event.newModel;
        } else {
          categoryModels.add(event.newModel);
        }
        if (!menu.categories.contains(event.category)) {
          menu.categories.add(event.category);
        }

        menu.map[event.category] = categoryModels;
      }
      return menu;
    }).toList();
    debugPrint(updatedMenus.toString());

    emit(state.copyWith(menus: updatedMenus));
  }

  void _onRemoveMenuModel(RemoveMenuModel event, Emitter<MenuState> emit) {
    final updatedMenus = state.menus.map((menu) {
      if (menu.title == event.menuTitle) {
        final categoryModels = menu.map[event.category] ?? [];
        categoryModels
            .removeWhere((model) => model.name == event.removeModel.name);
        menu.map[event.category] = categoryModels;
        if (categoryModels.isEmpty) {
          menu.categories.remove(event.category);
        }
      }
      return menu;
    }).toList();

    emit(state.copyWith(menus: updatedMenus));
  }
}
