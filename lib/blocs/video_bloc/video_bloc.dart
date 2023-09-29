import 'dart:async';

import 'package:contest_app/data/repository/video_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contest_app/data/models/video_model/video_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/status/form_status.dart';
import '../../data/models/universal_data.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoStates> {

  VideoBloc({required this.videoRepository})
      : super(
    VideoStates(
      videos: const [],
      videoModel: VideoModel(
        title: "",
        id: 0,
        description: "",
        videoLink: "",
      ),
      status: FormStatus.pure,
    ),
  ) {
    on<GetVideosEvent>(getVideos);
    on<GetByIdVideoEvent>(getByIdVideo);
    on<AddVideoEvent>(addVideo);
    on<UpdateVideoEvent>(updateVideo);
    on<DeleteVideoEvent>(deleteVideo);
  }

  final VideoRepository videoRepository;

  Future<void> getVideos(
      GetVideosEvent event, Emitter<VideoStates> emit) async {
        emit(state.copyWith(status: FormStatus.loading));
        UniversalData response = await videoRepository.getAllVideos();

    if (response.error.isEmpty) {
      print(response.data);
      emit(state.copyWith(
        status: FormStatus.success,
        videos: response.data as List<VideoModel>
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }

  }

  Future<void> getByIdVideo(
      GetByIdVideoEvent event, Emitter<VideoStates> emit) async {
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


  Future<void> addVideo(
      AddVideoEvent event, Emitter<VideoStates> emit) async {
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


  Future<void> updateVideo(
      UpdateVideoEvent event, Emitter<VideoStates> emit) async {

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

  Future<void> deleteVideo(
      DeleteVideoEvent event, Emitter<VideoStates> emit) async{

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