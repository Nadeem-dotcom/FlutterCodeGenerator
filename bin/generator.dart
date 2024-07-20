import 'dart:io';
import 'GeneratedCode/stCode.dart';
import 'GeneratedCode/stfulCode.dart';
import 'GeneratedCode/getController.dart';

enum FileType { stateless, stateful, getxController }

void main() {
  List<String> optionList = [
    "State-Less Widget File",
    "State-Full Widget File",
    "Get-X Controller File",
  ];

  print("Please select an option:");
  for (var i = 0; i < optionList.length; i++) {
    print("${i + 1}. ${optionList[i]}");
  }

  String optionInput =
      getValidatedInput('Please enter the file name (e.g., my_file.dart):', allowEmpty: false);
  int selectedOption;

  try {
    selectedOption = int.parse(optionInput);
  } catch (e) {
    print('Invalid option. Please enter a valid number.');
    return;
  }

  String fileName =
      getValidatedInput('Please enter the file name:', allowEmpty: false);
  fileName = handleInput(fileName);

  fileCreator(option: selectedOption, fileName: fileName);
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

String getValidatedInput(String prompt, {bool allowEmpty = false}) {
  while (true) {
    print(prompt);
    String? input = stdin.readLineSync();

    if (input != null) {
      if (input.isNotEmpty || allowEmpty) {
        return input;
      } else {
        print('Input cannot be empty. Please try again.');
      }
    } else {
      print('Input cannot be empty. Please try again.');
    }
  }
}

String handleInput(String fileName) {
  if (fileName.contains(".dart")) {
    return fileName;
  } else {
    return "$fileName.dart";
  }
}

void fileCreator({required int option, required String fileName}) {
  try {
    final File file = File(fileName);
    String content;

    switch (option) {
      case 1:
        final widgetName =
            capitalizeFirstLetter(fileName.replaceAll(".dart", ''));
        content = st.replaceAll("{{WidgetName}}", widgetName);
        break;
      case 2:
        final widgetName =
            capitalizeFirstLetter(fileName.replaceAll(".dart", ''));
        content = stFul.replaceAll("{{WidgetName}}", widgetName);
        break;
      case 3:
        final controllerName =
            capitalizeFirstLetter(fileName.replaceAll('.dart', ''));
        content =
            controllerTemplate.replaceAll('{{controllerName}}', controllerName);
        break;
      default:
        throw ArgumentError('Invalid option selected');
    }

    file.writeAsStringSync(content);
    print('Created $fileName with the appropriate template.');
  } catch (e) {
    print('Error: $e');
  }
}
