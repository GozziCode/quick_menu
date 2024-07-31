import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/menu_model.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuListBloc extends Bloc<MenuListEvent, MenuListState> {
  MenuListBloc() : super(MenuListState(menus: [])) {
    on<AddMenu>(_onAddMenu);
    on<DeleteMenu>(_onDeleteMenu);
  }

  void _onAddMenu(AddMenu event, Emitter<MenuListState> emit) {
    final updatedMenus = List<Menu>.from(state.menus)..add(event.menu);
    emit(state.copyWith(menus: updatedMenus));
  }

  void _onDeleteMenu(DeleteMenu event, Emitter<MenuListState> emit) {
    final updatedMenus =
        state.menus.where((menu) => menu.title != event.title).toList();
    emit(state.copyWith(menus: updatedMenus));
  }
}
