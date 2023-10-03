import 'package:contest_app/blocs/book/book_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_state.dart';
import 'package:contest_app/cubit/download/downloader_cubit.dart';
import 'package:contest_app/data/models/book/book_model.dart';
import 'package:contest_app/data/repository/file_info.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/ui/tab/home/sub_screens/books/widgets/book_item.dart';
import 'package:contest_app/ui/widgets/global_app_bar.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(body: BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return GlobalAppBar(
          title: 'Lorem Ipsum',
          subtitle: 'Kitob',
          image: AppIcons.image3,
          onTap: () {},
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 20 * height / 812)),
              SliverList(
                  delegate: SliverChildBuilderDelegate(childCount:state.categoryModel.books.length, (context, index) {
                BookModel book = state.categoryModel.books[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20 * width /375, vertical: 24 * height /812),
                  child: BookItem(
                      image: AppIcons.books,
                      title: book.title,
                      subtitle: book.author,
                      height: height,
                      width: width,
                      onTap: () {
                        context.read<DownLoaderCubit>().downloadFile(fileInfo: filesData.first);

                        // context.read<BookBloc>().add(GetByIdBookEvent(bookId: book.id));
                        // Navigator.pushNamed(context, RouteNames.booksDetail, arguments: book.title);
                      }),
                );
              }))
            ],
          ),
        );
      },
    ));
  }
}
