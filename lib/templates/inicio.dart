import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dados.dart';

class Inicio extends StatefulWidget {

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController peso = TextEditingController();
  int percent = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tunagem Forza"),
          actions: [
            /*IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: (){
                ///ir para a tela de informacoessssssssssssssssssssssssss
              },
            ),*/
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).secondaryHeaderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Preencha os dados abaixo:",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Peso do carro (Libras):",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).secondaryHeaderColor
                          )
                      ),
                      child: TextField(
                        controller: peso,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " Ex: 2500",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Porcentagem de dianteira:",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.remove_circle, color: Theme.of(context).secondaryHeaderColor),
                          onTap: (){
                            if(percent > 0){
                              setState(() {
                                percent = percent - 1;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${percent}%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          child: Icon(Icons.add_circle, color: Theme.of(context).secondaryHeaderColor),
                          onTap: (){
                            if(percent < 100){
                              setState(() {
                                percent = percent + 1;
                              });
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              /*GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.black
                  ),
                  child: Text(
                    "Gerar Dados",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ),
                onTap: (){
                  if(peso.text.length == 0){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Erro!"),
                        content: Text("Informe um valor para o peso"),
                        actions: [
                          FlatButton(
                            child: Text("Ok"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dados(peso: int.parse(peso.text), percent: percent)));
                  }

                },
              )*/
              RaisedButton(
                child: Text("Gerar Dados"),
                onPressed: (){
                  if(peso.text.length == 0){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Erro!"),
                        content: Text("Informe um valor para o peso"),
                        actions: [
                          FlatButton(
                            child: Text("Ok"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dados(peso: int.parse(peso.text), percent: percent)));
                  }
                },
              ),
              /*FlatButton(
                child: Text("Gerar Dados"),
                //textColor: Colors.white,
                //color: Colors.black,
                //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                onPressed: (){
                  if(peso.text.length == 0){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Erro!"),
                        content: Text("Informe um valor para o peso"),
                        actions: [
                          FlatButton(
                            child: Text("Ok"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dados(peso: int.parse(peso.text), percent: percent)));
                  }
                },
              )*/
            ],
          ),
        )
    );
  }
}
