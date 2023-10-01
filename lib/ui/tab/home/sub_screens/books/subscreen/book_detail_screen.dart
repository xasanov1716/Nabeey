import 'package:contest_app/blocs/book/book_bloc.dart';
import 'package:contest_app/data/models/status.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if(state.status == FormStatus.success){
            return Text(state.bookModel.title);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state.status == FormStatus.success) {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AppIcons.books,
                      height: height * 148 / 812,
                      width: width * 121 / 375,
                    ),
                    Column(
                      children: [
                        Text(
                          state.bookModel.title,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(state.bookModel.description),
                      ],
                    )
                  ],
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
