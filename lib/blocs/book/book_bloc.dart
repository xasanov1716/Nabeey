import 'dart:async';
import 'package:contest_app/data/models/book/book_model.dart';
import 'package:contest_app/data/helper/helper_model.dart';
import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/data/repository/book_repository.dart';
import 'package:contest_app/data/status/form_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_event.dart';

part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc({required this.bookRepoSitory})
      : super(
          BookState(
            errorText: '',
            books: const [],
            bookModel: BookModel(
              id: 0,
              title: "",
              author: "",
              description: "",
              file: HelperModel(fileName: "", filePath: "", id: 0),
              image: HelperModel(id: 0, fileName: "", filePath: ""),
            ),
            status: FormStatus.pure,
          ),
        ) {
    on<GetBooksEvent>(getBooks);
    on<GetByIdBookEvent>(getBookById);
    on<AddBookEvent>(addBook);
    on<UpdateBookEvent>(updateBook);
    on<DeleteBookEvent>(deleteBook);
  }


  final BookRepoSitory bookRepoSitory;

  Future<void> getBooks(GetBooksEvent event, Emitter<BookState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
      UniversalData data = await bookRepoSitory.getBook();

    if (data.error.isEmpty) {
      emit(state.copyWith(
        books: data.data as List<BookModel>,
        status: FormStatus.success,
      ));
    }
    emit(state.copyWith(
      errorText: data.error,
      status: FormStatus.failure,
    ));
  }

  Future<void> getBookById(
      GetByIdBookEvent event, Emitter<BookState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
  UniversalData data = await bookRepoSitory.getBookById(event.bookId);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        bookModel: data as BookModel,
        status: FormStatus.success,
      ));
    }

    emit(state.copyWith(
      errorText: data.error,
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
