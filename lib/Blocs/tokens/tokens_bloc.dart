import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tokens_event.dart';
part 'tokens_state.dart';

class TokensBloc extends Bloc<TokensEvent, TokensState> {
  TokensBloc() : super(TokensInitialState()) {
    on<TokensEvent>((event, emit) {
      emit(TokensInitialState());
    });
  }
}
