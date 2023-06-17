import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Util {
  static const String regexEmail = "[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
  static const String regexCelular = "[0-9]{2}[\s]{1}[0-9]{5}[-]{1}[0-9]{4}";
  static MaskTextInputFormatter mascaraTelefone = MaskTextInputFormatter(mask: "(##) #####-####");
  static MaskTextInputFormatter mascaraCpf = MaskTextInputFormatter(mask: "###.###.###-##");
  static MaskTextInputFormatter mascaraRa = MaskTextInputFormatter(mask: "###########");
}