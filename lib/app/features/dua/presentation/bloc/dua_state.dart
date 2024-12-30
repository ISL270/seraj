part of 'dua_bloc.dart';

sealed class DuaState extends Equatable {
  const DuaState();
  
  @override
  List<Object> get props => [];
}

final class DuaInitial extends DuaState {}
