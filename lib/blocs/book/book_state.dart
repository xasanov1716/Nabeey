part of 'book_bloc.dart';

@immutable

class BookState extends Equatable {
  final List<BookModel> books;
  final BookModel bookModel;
  final FormStatus status;

  const BookState({
    required this.books,
    required this.bookModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
    bookModel,
    status,
    books
  ];

  BookState copyWith({
    BookModel? bookModel,
    FormStatus? status,
    List<BookModel>? books,
  }) {
    return BookState(
      bookModel: bookModel ?? this.bookModel,
      status: status ?? this.status,
      books: books ?? this.books,
    );
  }
}
