import 'package:equatable/equatable.dart';
import '../../data/models/audio/audio_model.dart';
import '../../data/models/status/form_status.dart';

class AudiosStates extends Equatable {
  final List<AudioModel> audio;
  final AudioModel audioModel;
  final FormStatus status;
  final String errorText;

  const AudiosStates({
    required this.errorText,
    required this.audio,
    required this.audioModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
    audioModel,
    status,
    audio,
    errorText
  ];

  AudiosStates copyWith({
    AudioModel? audioModel,
    FormStatus? status,
    List<AudioModel>? audio,
    String? errorText
  }) {
    return AudiosStates(
      errorText: errorText ?? this.errorText,
      audioModel: audioModel ?? this.audioModel,
      status: status ?? this.status,
      audio: audio ?? this.audio,
    );
  }
}
