import 'package:flutter/material.dart';

class Dados extends StatefulWidget {
  int peso;
  int percent;

  Dados({this.peso, this.percent});

  @override
  _DadosState createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  double barraD;
  double barraT;
  double molaD;
  double molaT;
  double retornoD;
  double retornoT;
  double compressaoD;
  double compressaoT;

  dados(dadoD, dadoT, qtd, max, min, texto, tipo){
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(texto, style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            shape: BoxShape.circle
        ),
        constraints: BoxConstraints(
          minHeight: 30,
          minWidth: 30,
        ),
      ),
      onTap: (){
        if((texto.contains("-")) & ((dadoD - qtd < min) || (dadoT - qtd < min))){
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Erro!", style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
              content: Text("Valor esperado inexistente", style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
              actions: [
                FlatButton(
                  child: Text("Ok", style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            )
          );
        } else if((texto.contains("+")) & ((dadoD + qtd > max) || (dadoT + qtd > max))){
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Erro!", style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
                content: Text("Valor esperado inexistente", style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
                actions: [
                  FlatButton(
                    child: Text("Ok", style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              )
          );
        } else{
          switch (tipo){
            case "barra":
              texto.contains("-") ? barraD = barraD - qtd : barraD = barraD + qtd;
              texto.contains("-") ? barraT = barraT - qtd : barraT = barraT + qtd;
              break;
            case "mola":
              texto.contains("-") ? molaD = molaD - qtd : molaD = molaD + qtd;
              texto.contains("-") ? molaT = molaT - qtd : molaT = molaT + qtd;
              break;
            case "retorno":
              texto.contains("-") ? retornoD = retornoD - qtd : retornoD = retornoD + qtd;
              texto.contains("-") ? retornoT = retornoT - qtd : retornoT = retornoT + qtd;
              break;
            case "compressao":
              texto.contains("-") ? compressaoD = compressaoD - qtd : compressaoD = compressaoD + qtd;
              texto.contains("-") ? compressaoT = compressaoT - qtd : compressaoT = compressaoT + qtd;
              break;
          }
          setState(() {
          });
        }
      },
    );
  }

  @override
  void initState() {
    barraD = 65 * (widget.percent / 100);
    barraT = 65 - barraD;
    molaD = (widget.peso * (widget.percent / 100)) / 2;
    molaT = (widget.peso * ((-widget.percent / 100) + 1)) / 2;

    retornoD = 20 * (widget.percent / 100);
    retornoT = 20 * ((-widget.percent / 100) + 1);

    compressaoD = retornoD / 2;
    compressaoT = retornoT / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("RESULTADOS:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
            SizedBox(height: 15),
            Text("peso: ${widget.peso}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[700])),
            Text("Dianteira: ${widget.percent}%", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[700])),
            SizedBox(height: 10),
            Text("Barra Estabilizadora:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            Row(
              children: [
                Column(
                  children: [
                    Text("Dianteira: ${barraD.toStringAsFixed(2)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Text("Traseira: ${barraT.toStringAsFixed(2)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                Spacer(),
                dados(barraD, barraT, 1, 65, 0, "-1", "barra"),
                SizedBox(
                  width: 10,
                ),
                dados(barraD, barraT, 1, 65, 0, "+1", "barra"),
              ],
            ),
            SizedBox(height: 10),
            Text("Precarga da Mola:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            Row(
              children: [
                Column(
                  children: [
                    Text("Dianteira: ${molaD.toStringAsFixed(1)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Text("Traseira: ${molaT.toStringAsFixed(1)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                Spacer(),
                dados(molaD, molaT, 25, 3000, 0, "-25", "mola"),
                SizedBox(
                  width: 10,
                ),
                dados(molaD, molaT, 25, 3000, 0, "+25", "mola"),
              ],
            ),
            SizedBox(height: 10),
            Text("AMORTECIMENTO:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            Text("Retorno:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            Row(
              children: [
                Column(
                  children: [
                    Text("Dianteira: ${retornoD.toStringAsFixed(1)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Text("Traseira: ${retornoT.toStringAsFixed(1)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                Spacer(),
                dados(retornoD, retornoT, 0.1, 20, 0, "-0.1", "retorno"),
                SizedBox(
                  width: 10,
                ),
                dados(retornoD, retornoT, 0.1, 20, 0, "+0.1", "retorno"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("Compressão:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            Row(
              children: [
                Column(
                  children: [
                    Text("Dianteira: ${compressaoD.toStringAsFixed(1)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Text("Traseira: ${compressaoT.toStringAsFixed(1)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                Spacer(),
                dados(compressaoD, compressaoT, 0.1, 20, 0, "-0.1", "compressao"),
                SizedBox(
                  width: 10,
                ),
                dados(compressaoD, compressaoT, 0.1, 20, 0, "+0.1", "compressao"),
              ],
            ),
          ],
        ),
      )
    );
  }
}
