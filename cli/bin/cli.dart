import 'dart:io';
const version = '3.0';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('dart version: $version');
  } else if (arguments.first == 'search') {
    final searchargs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWiki(searchargs);
  } else {
    printUsage();
  }
}

void printUsage() {
  print("The following commands are available: 'help', 'search <ARTICLE_NAME>', 'version'");
}

void searchWiki(List<String>? arguments) {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print("Please provide an article name to search for.");
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }
  print("Searching for article: $articleTitle");
}