import 'package:flutter/material.dart';

class AcceptDeliveriesPage extends StatefulWidget {
  const AcceptDeliveriesPage({Key? key}) : super(key: key);

  @override
  State<AcceptDeliveriesPage> createState() => _AcceptDeliveriesPageState();
}

class _AcceptDeliveriesPageState extends State<AcceptDeliveriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ulivery"),
      ),
      body: AcceptDeliveriesPageBody(),
    );
  }
}

class AcceptDeliveriesPageBody extends StatefulWidget {
  const AcceptDeliveriesPageBody({Key? key}) : super(key: key);

  @override
  State<AcceptDeliveriesPageBody> createState() => _AcceptDeliveriesPageBodyState();
}

class _AcceptDeliveriesPageBodyState extends State<AcceptDeliveriesPageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Expanded(
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(2.5),
              1: FlexColumnWidth(2.5),
              2: FlexColumnWidth(2.5),
              3: FlexColumnWidth(2.5)
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1
                    )
                  )
                ),
                children: [
                  Text("Order", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                  Text("Acceptatietijd", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                  Text("Bezorgtijd" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                  Text("Acceptatie" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,)
                ]
              ),
              TableRow(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1
                          )
                      )
                  ),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text("#897", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text("-", textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text("30 min.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Icon(Icons.check_circle_rounded, size: 50,))
                ]
              ),
              TableRow(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1
                          )
                      )
                  ),
                  children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("#897", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("9 min", textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("30 min.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Icon(Icons.check_circle_outline, size: 50,))
                  ]
              ),
              TableRow(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1
                          )
                      )
                  ),
                  children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("#897", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("9 min", textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("30 min.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Icon(Icons.check_circle_outline, size: 50,))
                  ]
              ),
            ],
          ),

        ),
    );
  }
}
