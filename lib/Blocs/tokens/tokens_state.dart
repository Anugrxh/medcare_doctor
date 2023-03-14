part of 'tokens_bloc.dart';

@immutable
abstract class TokensState {}

class TokensInitialState extends TokensState {}

class TokensLoadingState extends TokensState {}

class TokensSuccessState extends TokensState {}

class TokensFailureState extends TokensState {}
