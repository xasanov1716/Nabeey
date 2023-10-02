import 'package:contest_app/cubit/audios/audios_state.dart';
import 'package:contest_app/data/models/audio/audio_model.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/data/repository/audios_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudiosCubit extends Cubit<AudiosState> {
  AudiosCubit({required this.audiosRepository})
      : super(
            const AudiosState(status: FormStatus.pure, audios: [], error: ""));

  final AudiosRepository audiosRepository;

  getAudios() async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data = await audiosRepository.getAudios();

    if (data.error.isEmpty) {
      emit(state.copyWith(
        audios: data.data as List<AudioModel>,
        status: FormStatus.success,
      ));
    }
    emit(state.copyWith(
      error: data.error,
      status: FormStatus.failure,
    ));
  }
}
