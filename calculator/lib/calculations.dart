// ignore_for_file: prefer_initializing_formals
import 'package:math_expressions/math_expressions.dart';

class Calculations{
  var inputValues='';
  //String numbers='0123456789';
  String answer='';
  //List<String> numbers=['0','1','3','4','5','6','7','8','9'];
  String operations='+-*/()';
  List<dynamic> values=[];
  Calculations({required inputValues}){
  this.inputValues=inputValues;
  }
  calEngine(){
    String finaluserinput=inputValues;
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
     
    /* String ns='';
     String op='';
     int? f;
     int s;
     int k=-1;
     
     for(int i=0;i<inputValues.length;i++){
        if(numbers.contains(inputValues[i])){
          ns+=inputValues[i];
          if(i==inputValues.length-1){
            values.add(int.parse(ns));
          }
        }else if(operations.contains(inputValues[i])){
          op=inputValues[i];
          if(ns.isEmpty){
            values.add(op);
          }else{
            values.add(int.parse(ns));
            values.add(op);
          }
          ns='';
          op='';
        }else{
           
        }
     }
      print(values.toString());
      for(int i=0;i<values.length;i++){
          if(!operations.contains(values[i])){
            f=int.parse(values[i]);
            k++;

          }else{
            op=values[i];
            k++;
            if((answer.toString().isNotEmpty)&&(op=='+')){
              k++;
              s=int.parse(values[k]);
              answer=f!+s;
            }
          }

          
           
            
      }*/
  }
  String calAnswer(){
    return answer.toString();
  }

}