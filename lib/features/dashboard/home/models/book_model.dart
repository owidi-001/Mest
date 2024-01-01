class Book {
  String? genre;
  String? title;
  String? url;
  String? coverImage;
  String? author;
  String? edition;
  String? publisher;
  String? ISBN;
  int? length;
  Book(
      {this.genre,
      this.title,
      this.url,
      this.coverImage,
      this.author,
      this.edition,
      this.publisher,
      this.ISBN,
      this.length});

  static List<Book> dummy = [
    Book(
        title: "Mountain View Images of America",
        url: "",
        coverImage: "assets/images/book1.png",
        author: "Nicholas Perry",
        edition: "illustrated",
        publisher: "Arcadia Publishing, 2006",
        ISBN: "0738531367, 9780738531366",
        length: 128),
    Book(
        title: "Images of America",
        url: "",
        coverImage: "assets/images/book2.png",
        author: "Nicholas Perry",
        edition: "illustrated",
        publisher: "Arcadia Publishing, 2006",
        ISBN: "0738531367, 9780738531366",
        length: 128),
    Book(
        title: "Mountain View Images of America",
        url: "",
        coverImage: "assets/images/book3.png",
        author: "Nicholas Perry",
        edition: "illustrated",
        publisher: "Arcadia Publishing, 2006",
        ISBN: "0738531367, 9780738531366",
        length: 128)
  ];
}
