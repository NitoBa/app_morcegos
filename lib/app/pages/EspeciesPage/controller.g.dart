// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EspeciesController on _EspeciesControllerBase, Store {
  final _$morcegosAtom = Atom(name: '_EspeciesControllerBase.morcegos');

  @override
  ObservableList<Morcegos> get morcegos {
    _$morcegosAtom.context.enforceReadPolicy(_$morcegosAtom);
    _$morcegosAtom.reportObserved();
    return super.morcegos;
  }

  @override
  set morcegos(ObservableList<Morcegos> value) {
    _$morcegosAtom.context.conditionallyRunInAction(() {
      super.morcegos = value;
      _$morcegosAtom.reportChanged();
    }, _$morcegosAtom, name: '${_$morcegosAtom.name}_set');
  }

  final _$opacityAtom = Atom(name: '_EspeciesControllerBase.opacity');

  @override
  double get opacity {
    _$opacityAtom.context.enforceReadPolicy(_$opacityAtom);
    _$opacityAtom.reportObserved();
    return super.opacity;
  }

  @override
  set opacity(double value) {
    _$opacityAtom.context.conditionallyRunInAction(() {
      super.opacity = value;
      _$opacityAtom.reportChanged();
    }, _$opacityAtom, name: '${_$opacityAtom.name}_set');
  }

  final _$_EspeciesControllerBaseActionController =
      ActionController(name: '_EspeciesControllerBase');

  @override
  void openEspecies(dynamic context) {
    final _$actionInfo =
        _$_EspeciesControllerBaseActionController.startAction();
    try {
      return super.openEspecies(context);
    } finally {
      _$_EspeciesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOpacity() {
    final _$actionInfo =
        _$_EspeciesControllerBaseActionController.startAction();
    try {
      return super.setOpacity();
    } finally {
      _$_EspeciesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic refresh(dynamic context) {
    final _$actionInfo =
        _$_EspeciesControllerBaseActionController.startAction();
    try {
      return super.refresh(context);
    } finally {
      _$_EspeciesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openPage(dynamic context, int index) {
    final _$actionInfo =
        _$_EspeciesControllerBaseActionController.startAction();
    try {
      return super.openPage(context, index);
    } finally {
      _$_EspeciesControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
