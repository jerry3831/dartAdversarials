const version = '3.0';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('dart version: $version');
  } else if (arguments.first == 'search') {
    searchWiki(arguments);
  } else {
    printUsage();
  }
}

void printUsage() {
  print("The following commands are available: 'help', 'search <ARTICLE_NAME>', 'version'");
}

void searchWiki(List<String>? arguments) {
  print("search this article: $arguments");
}