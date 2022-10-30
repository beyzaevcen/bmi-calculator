import 'dart:math';
class CalculatorBrain{
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI(){
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);//Virgülden sonra saedec bir basamak istediğimiz için bunu kullanıyoruz.

  }

  String getResult(){
    if(_bmi>=25) {
      return "Overweight";
    }else if(_bmi>18.5){
      return "Normal";
    }else{
      return "Underweight";
    }

  }
  String getInterpretation(){
    if(_bmi>=25) {
      return "Your bmi is quite high honey.Try to exercise more and drink water<3";
    }else if(_bmi>18.5){
      return "Your bmi is normal honey.Soo good!!!";
    }else{
      return "Your bmi is quite low honey.Try eat more okay<3";
    }
  }
}