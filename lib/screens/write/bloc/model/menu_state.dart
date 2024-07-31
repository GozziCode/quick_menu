import 'package:equatable/equatable.dart';

import '../../../../models/menu_model.dart';

class MenuModelState extends Equatable {
  final Menu menu;

  const MenuModelState({required this.menu});

  @override
  List<Object> get props => [menu];

  MenuModelState copyWith({Menu? menu}) {
    return MenuModelState(menu: menu ?? this.menu);
  }
}
