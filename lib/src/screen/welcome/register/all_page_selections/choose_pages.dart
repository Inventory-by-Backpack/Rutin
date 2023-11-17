import 'common_choose.dart';

class ChoosePage extends CommonRegister {
  const ChoosePage({super.key});

  @override
  List<String> getOptions() {
    return ['At Home', 'At Work', 'At School'];
  }

  @override
  String getQuestionText() {
    return 'Where will you use?';
  }
}

class ChoosePage1 extends CommonRegister {
  const ChoosePage1({super.key});

  @override
  List<String> getOptions() {
    return [
      'Physical Possessions',
      'Digital Files',
      'Medical and Health',
      'Financial Holdings',
      'Collectibles and Valuables',
    ];
  }

  @override
  String getQuestionText() {
    return 'What do you want to control?';
  }
}

class ChoosePage2 extends CommonRegister {
  const ChoosePage2({super.key});

  @override
  List<String> getOptions() {
    return [
      'Just for Myself',
      'With Family and Friends',
      'With Colleagues or Partners',
    ];
  }

  @override
  String getQuestionText() {
    return 'How will you use?';
  }
}

class ChoosePage3 extends CommonRegister {
  const ChoosePage3({super.key});

  @override
  List<String> getOptions() {
    return [
      'Regularly',
      'Close to Deadlines',
      'Daily',
      'Weekly',
    ];
  }

  @override
  String getQuestionText() {
    return 'When can we notify you?';
  }
}
