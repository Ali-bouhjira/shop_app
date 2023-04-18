import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable{
  const LoginState();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginStateInitial extends LoginState{
  const LoginStateInitial();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginStateLoading extends LoginState{
  const LoginStateLoading();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginStateSuccess extends LoginState{
  const LoginStateSuccess();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginStateError extends LoginState{
  const LoginStateError(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [];

}