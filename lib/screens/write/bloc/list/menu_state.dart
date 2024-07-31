import 'package:equatable/equatable.dart';

import '../../../../models/menu_model.dart';

class MenuListState extends Equatable {
  final List<Menu> menus;

  const MenuListState({required this.menus});

  @override
  List<Object> get props => [menus];

  MenuListState copyWith({List<Menu>? menus}) {
    return MenuListState(
      menus: menus ?? this.menus,
    );
  }
}
