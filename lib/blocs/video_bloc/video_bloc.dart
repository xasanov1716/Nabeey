import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contest_app/data/models/video_model/video_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/status/form_status.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoStates> {

  VideoBloc()
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

  Future<void> getVideos(
      GetVideosEvent event, Emitter<VideoStates> emit) async {

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