
import 'package:contest_app/data/models/audio/audio_model.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:equatable/equatable.dart';

class AudiosState extends Equatable {
  final FormStatus status;
  final List<AudioModel> audios;
  final String error;

  factory AudiosState.initial() {
    return const AudiosState(
        status: FormStatus.pure, audios: [], error: "");
  }

  const AudiosState(
      {required this.status, required this.audios, required this.error});
  @override
  List<Object?> get props => [status, audios, error];

  @override
  bool get stringify => true;

  AudiosState copyWith({
    FormStatus? status,
    List<AudioModel>? audios,
    String? error,
  }) {
    return AudiosState(
      status: status ?? this.status,
      audios: audios ?? this.audios,
      error: error ?? this.error,
    );
  }
}