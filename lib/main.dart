import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  List<String> calcListi = [];
  bool isEqualed = false;
  bool isCounted = false;
  bool isMinus = true;
  dynamic javob = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Calculator",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                  onTap: () {
                    if (calcListi.isNotEmpty) {
                      calcListi.removeLast();
                      javob = "";
                      if (isEqualed) {
                        calcListi.clear();
                      }
                    }
                    setState(() {});
                  },
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: isCounted
                        ? Text(
                        
                            calcListi.join(),
                            style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 133, 130, 130)),
                          )
                        : Text(""
                          //  calcListi.join(),
                          //   style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 133, 130, 130)),
                        ),
                  ),
                  subtitle: Container(
                    alignment: Alignment.centerRight,
                    child: isEqualed
                        ? Text(
                            javob.toString(),
                            style: TextStyle(fontSize: 38, color: Colors.white),
                          )
                        : Text(
                            calcListi.join(),
                            style: TextStyle(fontSize: 38, color: Colors.white),
                          ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          calcListi.clear();
                          javob = "";
                        });
                      },
                      child: Text(
                        "c",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        backgroundColor: Color.fromARGB(255, 140, 134, 133),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (isMinus == true) {
                            isMinus = false;
                            calcListi.insert(0, "-");
                          } else if (isMinus == false &&
                              calcListi.first == "-") {
                            isMinus = true;
                            calcListi.remove("-");
                            
                          }
                        });
                      },
                      child: Text(
                        "+-",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        backgroundColor: Color.fromARGB(255, 140, 134, 133),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("%");
                      },
                      child: Text(
                        "%",
                        style: TextStyle(fontSize: 30),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(70, 70),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(65)),
                          backgroundColor: Colors.amber),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("/");
                      },
                      child: Text(
                        "/",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("1");
                      },
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("2");
                      },
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("3");
                      },
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc(
                          "*",
                        );
                      },
                      child: Text(
                        "x",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("4");
                      },
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("5");
                      },
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("6");
                      },
                      child: Text(
                        "6",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("-");
                      },
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("7");
                      },
                      child: Text(
                        "7",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("8");
                      },
                      child: Text(
                        "8",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("9");
                      },
                      child: Text(
                        "9",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("+");
                      },
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 27),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc("0");
                      },
                      child: Text(
                        "0             ",
                        style: TextStyle(fontSize: 27),
                        textAlign: TextAlign.start,
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(155, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        belgiQoshishFunc(".");
                      },
                      child: Text(".",
                          style: TextStyle(
                            fontSize: 27,
                          )),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(65)),
                        backgroundColor: Color.fromARGB(255, 58, 53, 53),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        isEqualed = true;
                        isCounted = true;
                        hisobla(calcListi);
                        setState(() {
                          
                        });
                      },
                      child: Text(
                        "=",
                        style: TextStyle(fontSize: 30),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(70, 70),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(65)),
                          backgroundColor: Colors.amber),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ));
  }

  belgiQoshishFunc(String belgi) {
    var last = calcListi.isNotEmpty ? calcListi.last : "";
    isEqualed ? isEqualed = false : null;
    if (belgi == "+" || belgi == "-" || belgi == "*") {
      if (last != "+" && last != "*" && last != "/") {
        if (calcListi.isNotEmpty || belgi == "-") {
          calcListi.add(belgi);
        }
      } else {}
    } else {
      calcListi.add(belgi);
      isEqualed ? isEqualed = false : null;
    }
    setState(() {});
  }

  hisobla(List<String> sonlar) {
    var last = sonlar.last;
    if (last == "/" || last == "+" || last == "*") {}

    String son = sonlar.join();

    Parser p = Parser();

    Expression exp = p.parse(son);

    javob = exp.evaluate(EvaluationType.REAL, ContextModel());

    // calcListi.clear();
    setState(() {});
  }
}
