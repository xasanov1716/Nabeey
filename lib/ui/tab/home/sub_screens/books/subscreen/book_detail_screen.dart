import 'package:contest_app/blocs/book/book_bloc.dart';
import 'package:contest_app/data/models/status.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocConsumer<BookBloc, BookState>(
          builder: (context, state) {
            if (state.status == FormStatus.success) {
              return Text(state.bookModel.title);
            }
            if (state.status == FormStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == FormStatus.failure) {
              return const Center(
                child: Text("Error"),
              );
            }
            return Center(
              child: Text("Default"),
            );
          },
          listener: (context, state) {},
        ));
  }
}
