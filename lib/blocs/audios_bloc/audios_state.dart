import 'package:equatable/equatable.dart';
import '../../data/models/audio/audio_model.dart';
import '../../data/models/status/form_status.dart';

class AudiosStates extends Equatable {
  final List<AudioModel> audio;
  final AudioModel audioModel;
  final FormStatus status;

  const AudiosStates({
    required this.audio,
    required this.audioModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
    audioModel,
    status,
    audio,
  ];

  AudiosStates copyWith({
    AudioModel? audioModel,
    FormStatus? status,
    List<AudioModel>? audio,
  }) {
    return AudiosStates(
      audioModel: audioModel ?? this.audioModel,
      status: status ?? this.status,
      audio: audio ?? this.audio,
    );
  }
}
