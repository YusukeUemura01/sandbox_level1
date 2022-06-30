import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/firestore_repository.dart';
import 'package:sandbox_level1/model/account.dart';

part 'navigation_page_controller.freezed.dart';
@freezed
class NavigationPageState with _$NavigationPageState {
  factory NavigationPageState({
    required int bottomNavigationIndex,
    required List<Widget>pageList,
  }) = _NavigationPageState;
}


class NavigationPageController extends StateNotifier<NavigationPageState>{
  NavigationPageController(NavigationPageState state) : super(state);

  void changeBottomNavigationIndex(int _index){
    state = state.copyWith(bottomNavigationIndex: _index);
  }
}