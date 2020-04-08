
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:talab_market/models/retailer.dart';
import 'package:talab_market/services/addproductdata.dart';
import 'package:talab_market/services/editretailer.dart';
import 'package:talab_market/shared/loading.dart';

class Invoice extends StatefulWidget {
  String id;
  String name;


  Invoice({this.id,this.name});

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {




  Printtopdf()async{
    await Printing.sharePdf(bytes: pdf.save(), filename: 'my-document.pdf');
     List list = [1, 2, 3];
    List list2 = [0, ...list];
    print(list2);



  }

  final pdf = pw.Document();

  writeOnPdf(List baba){
    List <List<String>> mama=[];
    for (int i=0 ; i< baba.length; i++){
    mama.add([baba[i]["name"], "${baba[i]["price"]}", "${baba[i]["quantity"]}","${baba[i]["total"]}"])  ;
    }


    pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.all(32),
          build: (pw.Context context){


     return <pw.Widget>[

       pw.Table.fromTextArray(context: context, data:
         mama


       ),

       pw.Paragraph(text:"\n\nArabic Middle East Food"),
       



           ];



          }


        ));
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {


    num totalfinal = 0;
    return StreamBuilder<RetailerData>(
        stream: EditRetailer(id: widget.id).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            RetailerData userData = snapshot.data;
            List zaher = userData.buy;
            if (zaher!= null){
              for (int i = 0; i < zaher.length; i++) {
                Map mapsome = zaher[i];

                num total = zaher[i]['price'] * zaher[i]['quantity'];
                totalfinal = total + totalfinal;
                mapsome["total"] = total;
              }}
            else{
              zaher = [];
            }
            zaher.add(
                {"name": "", "quantity": "", "price": "", "total": totalfinal});
            zaher.insert(0, {
              "name": "name",
              "quantity": "quantity",
              "price": "price",
              "total": "total"
            });
            zaher.insert(0, {
              "name": "${widget.name}",
              "quantity": "${DateFormat.yMMMd().format(new DateTime.now())}",
              "price": "",
              "total": ""
            });



            printpage() {


              print(DateTime.now());
              return


                ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                  itemCount: zaher.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(zaher[index]["name"]),
                        ),
                        Expanded(child: Text("${zaher[index]["price"]}")),
                        Expanded(child: Text("${zaher[index]["quantity"]}")),
                        Expanded(child: Text("${zaher[index]["total"]}")),
                      ],
                    ),
                  ),
                );
            }

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightBlue,
                title: Text("Invoice"),
              ),
              body:


                printpage(),





              floatingActionButton: FloatingActionButton(
                onPressed: () async {

                  await Addproductdata(id: widget.id).deletesellData();
                  writeOnPdf(zaher);
                  await savePdf();
                  Printtopdf();




                  // Add your onPressed code here!
                },
                tooltip: 'Increment',
                child: Icon(Icons.picture_as_pdf),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            return Loading();
          }
        });
  }

}
