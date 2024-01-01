import 'package:mest/features/dashboard/home/models/book_model.dart';

class UserBook {
  late final Book book;
  late final int pagesRead;

  UserBook({
    required this.book,
    required this.pagesRead,
  });

  UserBook copyWith({Book? book, int? pagesRead}) {
    return UserBook(
        book: book ?? this.book,
        pagesRead: pagesRead ?? this.pagesRead);
  }

  static Map<String, dynamic> toMap(UserBook item) {
    Map<String, dynamic> data = {
      "book": item.book,
      "pagesRead": item.pagesRead
    };

    return data;
  }
}
