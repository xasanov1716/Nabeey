part of 'video_bloc.dart';

class VideoStates extends Equatable {
  final List<VideoModel> videos;
  final VideoModel videoModel;
  final FormStatus status;

  const VideoStates({
    required this.videos,
    required this.videoModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
    videoModel,
    status,
    videos
  ];

  VideoStates copyWith({
    VideoModel? videoModel,
    FormStatus? status,
    List<VideoModel>? videos,
  }) {
    return VideoStates(
      videoModel: videoModel ?? this.videoModel,
      status: status ?? this.status,
      videos: videos ?? this.videos,
    );
  }
}
