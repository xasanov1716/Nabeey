part of 'book_bloc.dart';

@immutable

class BookState extends Equatable {
  final List<BookModel> books;
  final BookModel bookModel;
  final FormStatus status;
  final String errorText;

  const BookState({
    required this.errorText,
    required this.books,
    required this.bookModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
    bookModel,
    status,
    errorText,
    books
  ];

  BookState copyWith({
    BookModel? bookModel,
    FormStatus? status,
    String? errorText,
    List<BookModel>? books,
  }) {
    return BookState(
      bookModel: bookModel ?? this.bookModel,
      status: status ?? this.status,
      books: books ?? this.books,
      errorText: errorText ?? this.errorText
    );
  }
}
