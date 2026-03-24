import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/icf_detail.dart';

class PdfExportService {
  static Future<void> exportCodes({
    required List<MapEntry<String, String>> codes,
    required Map<String, IcfDetail> details,
    String title = 'ICF Code-Zusammenstellung',
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        header: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(title,
                style: pw.TextStyle(
                    fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 4),
            pw.Text(
              'ICF Klassifikation - Erstellt am ${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
              style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey),
            ),
            pw.Divider(),
            pw.SizedBox(height: 8),
          ],
        ),
        footer: (context) => pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'Seite ${context.pageNumber} von ${context.pagesCount}',
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey),
          ),
        ),
        build: (context) => codes.map((entry) {
          final detail = details[entry.key];
          return pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 12),
            padding: const pw.EdgeInsets.all(12),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.grey300),
              borderRadius: pw.BorderRadius.circular(4),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: pw.BoxDecoration(
                        color: PdfColors.blue50,
                        borderRadius: pw.BorderRadius.circular(4),
                      ),
                      child: pw.Text(entry.key,
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 12,
                              color: PdfColors.blue900)),
                    ),
                    pw.SizedBox(width: 12),
                    pw.Expanded(
                      child: pw.Text(entry.value,
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 12)),
                    ),
                  ],
                ),
                if (detail != null && detail.description.isNotEmpty) ...[
                  pw.SizedBox(height: 6),
                  pw.Text(detail.description,
                      style:
                          const pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                ],
                if (detail != null && detail.inclusions.isNotEmpty) ...[
                  pw.SizedBox(height: 6),
                  pw.Text('Inkl.:',
                      style: pw.TextStyle(
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.green800)),
                  ...detail.inclusions.map((inc) => pw.Padding(
                        padding: const pw.EdgeInsets.only(left: 8),
                        child: pw.Text('\u2022 $inc',
                            style:
                                const pw.TextStyle(fontSize: 9, color: PdfColors.grey700)),
                      )),
                ],
                if (detail != null && detail.exclusions.isNotEmpty) ...[
                  pw.SizedBox(height: 6),
                  pw.Text('Exkl.:',
                      style: pw.TextStyle(
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.red800)),
                  ...detail.exclusions.map((exc) => pw.Padding(
                        padding: const pw.EdgeInsets.only(left: 8),
                        child: pw.Text('\u2022 $exc',
                            style:
                                const pw.TextStyle(fontSize: 9, color: PdfColors.grey700)),
                      )),
                ],
              ],
            ),
          );
        }).toList(),
      ),
    );

    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }
}
