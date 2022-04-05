part of 'common.dart';

extension CustomTextStyle on BuildContext {
  static const _Poppins_Regular = 'Poppins';
  static const _Poppins_Bold = 'Poppins-Bold';


  TextStyle toPop64RegularFont(Color color) => TextStyle(
      fontSize: fontSize(9.5), fontFamily: _Poppins_Regular, color: color);

  TextStyle toPop32RegularFont(Color color) => TextStyle(
      fontSize: fontSize(6.5), fontFamily: _Poppins_Regular, color: color);

  TextStyle toPop28RegularFont(Color color) => TextStyle(
      fontSize: fontSize(5.5), fontFamily: _Poppins_Regular, color: color);

  TextStyle toPop18RegularFont(Color color) => TextStyle(
      fontSize: fontSize(4.5), fontFamily: _Poppins_Regular, color: color);

  TextStyle toPop18RegularLineFont(Color color) => TextStyle(
      fontSize: fontSize(4.5), fontFamily: _Poppins_Regular, color: color, decoration: TextDecoration.underline);

  TextStyle toPop14RegularFont(Color color) => TextStyle(
      fontSize: fontSize(4.0), fontFamily: _Poppins_Regular, color: color);

  TextStyle toPop12RegularFont(Color color) => TextStyle(
      fontSize: fontSize(3.5), fontFamily: _Poppins_Regular, color: color);

  TextStyle toPop12RegularLineFont(Color color) => TextStyle(
      fontSize: fontSize(3.5), fontFamily: _Poppins_Regular, color: color, decoration: TextDecoration.underline);

  TextStyle toPop10RegularFont(Color color) => TextStyle(
      fontSize: fontSize(3.0), fontFamily: _Poppins_Regular, color: color);

}