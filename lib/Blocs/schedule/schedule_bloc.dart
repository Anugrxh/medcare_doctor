import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleInitialState()) {
    on<ScheduleEvent>((event, emit) async {
      emit(ScheduleLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('prescriptions');
      try {
        if (event is CreatePriscriptionEvent) {
          await queryTable.insert({
            'prescription': event.prescription,
          });
          add(GetAllScheduleEvent());
        }
      } catch (e, s) {}
    });
  }
}
