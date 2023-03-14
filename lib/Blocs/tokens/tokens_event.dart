part of 'tokens_bloc.dart';

@immutable
abstract class TokensEvent {}

class GetCurrentTokenEvent extends TokensEvent {}

class MarkTokenDoneEvent extends TokensEvent {
  final int tokenId;

  MarkTokenDoneEvent({required this.tokenId});
}

class AddPrescriptionEvent extends TokensEvent {
  final int tokenId;
  final String prescription;

  AddPrescriptionEvent({required this.tokenId, required this.prescription});
}

class AddConditionEvent extends TokensEvent {
  final int tokenId;
  final String condition;

  AddConditionEvent({required this.tokenId, required this.condition});
}

class GetTokenHistoryEvent extends TokensEvent {
  final int patientId;

  GetTokenHistoryEvent({required this.patientId});
}

class MarkTokenSkippedEvent extends TokensEvent {
  final int tokenId;

  MarkTokenSkippedEvent({required this.tokenId});
}
