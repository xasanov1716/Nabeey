import 'package:contest_app/data/models/audio/audio_model.dart';

abstract class AudiosEvent {}

class GetAudiosEvent extends AudiosEvent {}

class GetByIdAudioEvent extends AudiosEvent {
  final int audioId;

  GetByIdAudioEvent({required this.audioId});
}

class AddAudioEvent extends AudiosEvent {
  final AudioModel audioModel;

  AddAudioEvent({required this.audioModel});
}

class UpdateAudioEvent extends AudiosEvent {
  final AudioModel audioModel;

  UpdateAudioEvent({required this.audioModel});
}

class DeleteAudioEvent extends AudiosEvent {
  final int audioId;

  DeleteAudioEvent({required this.audioId});
}
class GetAudioByIdEvent extends AudiosEvent {
  final int audioId;

  GetAudioByIdEvent({required this.audioId});
}