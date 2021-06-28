import 'package:geo_learn/enums/difficulty.dart';
import 'package:geo_learn/models/question_model.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required int categoryId,
    required Difficulty difficulty,
  });
}
