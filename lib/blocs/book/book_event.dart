part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class GetBooksEvent extends BookEvent {}

class GetByIdBookEvent extends BookEvent {
  final int bookId;

  GetByIdBookEvent({required this.bookId});
}

class AddBookEvent extends BookEvent {
  final BookModel bookModel;

  AddBookEvent({required this.bookModel});
}

class UpdateBookEvent extends BookEvent {
  final BookModel bookModel;

  UpdateBookEvent({required this.bookModel});
}

class DeleteBookEvent extends BookEvent {
  final int videoId;

  DeleteBookEvent({required this.videoId});
}
class GetBookByIdEvent extends BookEvent {
  final int videoId;

  GetBookByIdEvent({required this.videoId});
}