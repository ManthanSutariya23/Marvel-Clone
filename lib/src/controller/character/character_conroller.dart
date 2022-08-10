
import 'package:marvel/src/model/model.dart';
import 'package:marvel/src/model/model_variable.dart';


class CharacterController {
  
  static getCharacterData () async {
    ModelVariable.character = await getData(arg: "characters");
  }

}


