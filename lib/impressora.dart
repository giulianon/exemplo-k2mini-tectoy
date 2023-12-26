import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/enums.dart';

class Impressora extends StatefulWidget {
  const Impressora({super.key});

  @override
  State<Impressora> createState() => _ImpressoraState();
}

class _ImpressoraState extends State<Impressora> {

  Future<void> _ativarImpressora() async {
    bool? result = await SunmiPrinter.bindingPrinter();
  }

  Future<void> _imprimir() async {
    await SunmiPrinter.startTransactionPrint(true);

    await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT); // Right align
    await SunmiPrinter.printText('Align right');

    await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);// Left align
    await SunmiPrinter.printText('Align left');

    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);// Center align
    await SunmiPrinter.printText('Align center');

    await SunmiPrinter.lineWrap(2); // Jump 2 lines

    await SunmiPrinter.setFontSize(SunmiFontSize.XL); // Set font to very large
    await SunmiPrinter.printText('Very Large font!');
    await SunmiPrinter.resetFontSize(); // Reset font to medium size

    await SunmiPrinter.setCustomFontSize(12); // SET CUSTOM FONT 12
    await SunmiPrinter.printText('Custom font size!!!');
    await SunmiPrinter.resetFontSize(); // Reset font to medium size

    await SunmiPrinter.printQRCode('https://github.com/TecToy-Automacao'); // PRINT A QRCODE
    await SunmiPrinter.lineWrap(10);
    await SunmiPrinter.submitTransactionPrint(); // SUBMIT and cut paper
    await SunmiPrinter.cut(); // SUBMIT and cut paper
    // await SunmiPrinter.submitTransactionPrint(); // SUBMIT and cut paper
    await SunmiPrinter.exitTransactionPrint(true); // Clo
  }

  @override
  void initState() {
    super.initState();
    _ativarImpressora();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impressora'),
      ),
      body: Center(
        child:  ElevatedButton(
          onPressed: _imprimir,
          child: const Text('Imprimir'),
        ),
      ),
    );
  }
}
