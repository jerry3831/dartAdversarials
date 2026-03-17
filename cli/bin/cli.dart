import 'dart:io';
import 'package:http/http.dart' as http;
const version = '3.0';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } 
  else if (arguments.first == 'version') {
    print('dart version: $version');
  } 
  else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWiki(inputArgs);
  } 
  else {
    printUsage();
  }
}

void printUsage() {
  print("The following commands are available: 'help', 'search <ARTICLE_NAME>', 'version'");
}

void searchWiki(List<String>? arguments) async {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print("Please provide an article name to search for.");
    final inputFromCli = stdin.readLineSync();
    
    // if user presses CTRL+D or CTRL+Z, inputFromCli will be empty. Handle that case.
    if (inputFromCli == null || inputFromCli.isEmpty) {
      print("No article retrieved.");
      return;
    }
    articleTitle = inputFromCli;
  } else {
    articleTitle = arguments.join(' ');
  }
 
//  actual article search and display
  print('Looking up article "$articleTitle" on wikipedia...');
  var articleContent = await getWikiArticlae(articleTitle);
  print(articleContent);
}

Future<String> getWikiArticlae(String title) async {
  final url = Uri.https(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$title'
  );

  // make http request.
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  }
  // in the event that the request fails
  return 'Error: article with title "$title" not found.';
}
