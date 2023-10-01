import 'dart:async';
import 'package:contest_app/data/helper/helper_model.dart';
import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/data/repository/audios_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/audio/audio_model.dart';
import '../../data/models/status/form_status.dart';
import 'audios_event.dart';
import 'audios_state.dart';

class AudiosBloc extends Bloc<AudiosEvent, AudiosStates> {
  AudiosBloc({required this.audiosRepository})
      : super(
          AudiosStates(
            errorText: "",
            audio: const [],
            audioModel: AudioModel(
              id: 0,
              title: "",
              description: "",
              audio: HelperModel(
                id: 0,
                fileName: '',
                filePath: '',
              ),
            ),
            status: FormStatus.pure,
          ),
        ) {
    on<GetAudiosEvent>(getAudios);
    on<GetByIdAudioEvent>(getByIdAudio);
    on<AddAudioEvent>(addAudio);
    on<UpdateAudioEvent>(updateAudio);
    on<DeleteAudioEvent>(deleteAudio);
  }

  final AudiosRepository audiosRepository;

  Future<void> getAudios(GetAudiosEvent event, Emitter<AudiosStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data = await audiosRepository.getAudios();

    if (data.error.isEmpty) {
      emit(state.copyWith(
        audio: data.data as List<AudioModel>,
        status: FormStatus.success,
      ));
    }
    emit(state.copyWith(
      errorText: data.error,
      status: FormStatus.failure,
    ));
  }

  Future<void> getByIdAudio(
      GetByIdAudioEvent event, Emitter<AudiosStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    if (true) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    }

    emit(state.copyWith(
      status: FormStatus.failure,
    ));
  }

  Future<void> addAudio(AddAudioEvent event, Emitter<AudiosStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    if (true) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    }

    emit(state.copyWith(
      status: FormStatus.failure,
    ));
  }

  Future<void> updateAudio(
      UpdateAudioEvent event, Emitter<AudiosStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    if (true) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    }

    emit(state.copyWith(
      status: FormStatus.failure,
    ));
  }

  Future<void> deleteAudio(
      DeleteAudioEvent event, Emitter<AudiosStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    if (true) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    }

    emit(state.copyWith(
      status: FormStatus.failure,
    ));
  }
}
