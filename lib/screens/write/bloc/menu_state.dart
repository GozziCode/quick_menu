import 'package:equatable/equatable.dart';

import '../../../models/menu_model.dart';

class MenuState extends Equatable {
  final List<Menu> menus;

  const MenuState({required this.menus});

  MenuState copyWith({List<Menu>? menus}) {
    return MenuState(menus: menus ?? this.menus);
  }

  @override
  List<Object> get props => [menus];
}
