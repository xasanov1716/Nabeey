import 'package:contest_app/blocs/book/book_bloc.dart';
import 'package:contest_app/data/status/form_status.dart';
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
        body: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if (state.status == FormStatus.success) {
              return ListView(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  Expanded(child: Image.asset(AppIcons.books,height: height * 148/812,width: width * 121 / 375)),
                  Expanded(child: Column(
                    children: [
                      Text(state.bookModel.description),
                    ],
                  )),
                  ],)
                ],
              );
            }
            if (state.status == FormStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == FormStatus.failure) {
              return const Center(
                child: Text("Error"),
              );
            }
            return const Center(
              child: Text("Default"),
            );
          },
        )
      );
  }
}
