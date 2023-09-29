import 'dart:async';
import 'package:contest_app/data/models/book/book_model.dart';
import 'package:contest_app/data/models/book/file_model.dart';
import 'package:contest_app/data/status/form_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_event.dart';

part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc()
      : super(
          BookState(
            books: const [],
            bookModel: BookModel(
              id: 0,
              title: "",
              author: "",
              description: "",
              file: FileClass(fileName: "", filePath: "", id: 0),
              image: FileClass(id: 0, fileName: "", filePath: ""),
            ),
            status: FormStatus.pure,
          ),
        ) {
    on<GetBooksEvent>(getBooks);
    on<GetByIdBookEvent>(getByIdBook);
    on<AddBookEvent>(addBook);
    on<UpdateBookEvent>(updateBook);
    on<DeleteBookEvent>(deleteBook);
  }

  Future<void> getBooks(GetBooksEvent event, Emitter<BookState> emit) async {
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

  Future<void> getByIdBook(
      GetByIdBookEvent event, Emitter<BookState> emit) async {
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

  Future<void> addBook(AddBookEvent event, Emitter<BookState> emit) async {
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

  Future<void> updateBook(
      UpdateBookEvent event, Emitter<BookState> emit) async {
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

  Future<void> deleteBook(
      DeleteBookEvent event, Emitter<BookState> emit) async {
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
