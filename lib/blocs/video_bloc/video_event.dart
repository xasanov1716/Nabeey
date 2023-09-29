part of 'video_bloc.dart';

@immutable
abstract class VideoEvent {}

class GetVideosEvent extends VideoEvent {}

class GetByIdVideoEvent extends VideoEvent {
  final int videoId;

  GetByIdVideoEvent({required this.videoId});
}

class AddVideoEvent extends VideoEvent {
  final VideoModel videoModel;

  AddVideoEvent({required this.videoModel});
}

class UpdateVideoEvent extends VideoEvent {
  final VideoModel videoModel;

  UpdateVideoEvent({required this.videoModel});
}

class DeleteVideoEvent extends VideoEvent {
  final int videoId;

  DeleteVideoEvent({required this.videoId});
}
class GetVideoByIdEvent extends VideoEvent {
  final int videoId;

  GetVideoByIdEvent({required this.videoId});
}