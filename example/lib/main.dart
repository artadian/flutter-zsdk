import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_zsdk/flutter_zsdk.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String zplData = "^XA\n" +
      "^CI28\n" +
      "^PON\n" +
      "^PW560\n" +
      "^MNN\n" +
      "^LL1270\n" +
      "^LH0,0\n" +
      //"^FWN,0\n" +
      //"^CF0\n" +
      //"^MMT\n" +
      "^FT10,102\n" +
      "^GFA,5796,5796,63,P0264,P07FC,N0C07FC,M07C07FC01E,L01FC07FC01F8,L07FE07FC01FEO01IF8I07IF,L07FE07FC03FFN03KF003JFEgO0FE,L03FF07FC03FFN0LF80LF8gM0IF,L03FF07FC07FFM01LFC1LF8gL0JF,L03FF07FC07FEM03LFC1LF8gK03JF,L01FF8IF07FEM03LFC1LF8gK0KF,J0C01OFC03K03LFC1LF8gJ03KF,I01E00OF8038J01LF80LF8gJ07KF,I03F00OF807CK0LF00KFEgK07KF,I07F80OF00FEK07JFE00JFgM0KFE,I0FFC1OF81FFK03JFE00IFCgM07JFE,001FFE7OFE3FF8J01JFC01IF8gM07JFE,001TF3FF8J01JFC01IFgN01JFE,I0WFK01JFC03FFEgO07IFE,I07UFEK01JFC07FFCgO03IFE,I03UFEL0JFC0IF8gO03IFE,I01KFEI07KFCL0JFC0IFQ0FFEN07E00FC003IFE00FFN07FF8M0FFC1EL07FFN01E001FC,J0KFK0KF8L0JFC1FFEP0JFCL0FFE03FF003IFE07FFEL03JFL07KFK07IFEL01FF00IF8,J03IFCK03JFM0JFC3FFEO07KFK0JF07FF803IFE1JFK01KFCK0LF8I03KF8K0IF03IFC,J07IFM0IFEM0JFEIFCN01LFCI03JF0IFC03IFE3JFCJ07LFJ03LFCI0LFEJ07IF07JF,0700IFEM07IF006J0NFCN07LFEI0KF0IFE03JF7JFEJ0MF8I07LFC003MFI03JF07JF,07E0IFCM03IF00EJ0NFEN0NF001KF1IFE03OFEI03MFEI07LFE007MF800KF0KF8,0FF9IF8N0IF83FJ0NFEM01IF1JF003OFE03PFI07NFI0MFE00IF8JF801KF9KFC,0LFJ07EI07FFC7FJ0OFM03FFE0JF803PF03PF800OF001JF9FFE01FFE07IFC03QFC,1KFEI0E3FI07FFDFF8I0OFM03FFC07IF803PF03PF801OF801JF07FF03FFC07IFC03QFC,1KFC001F3FI03KF8I0OF8L07FF807IFC03PF03PFC03IFC3JFC01IFE03FF03FFC03IFE01QFE,1KF8003F1F8001KF8I0OFCL07FF007IFC00PF03PFC03IF81JFC01IFE01FF03FF803IFE01QFE,3KFI03F9F8I0KFCI0OFEL07FE007IFC007NFE03PFC07IF00JFE03IFE00FF03FF003IFE007KF3JFE,0KFI07F8F8I0KFCI0PFL07FC007IFC003NFE03JF83JFE07IF007IFE03JF007E03FE003IFE003JFC0JFE,03IFEI07FCFCI07IFEJ0PF8K03F8007IFC003NFC03JF01JFE0JF007JF03JF800801FC003IFE003JF807IFE,007FFEI07FCFCI07IF8J0PFCL0EI07IFC001JF1IFC03JF00JFE0JF007JF01JFEK07I03IFE001JF803IFE,001FFCI07FCFCI03FFCK0PFEP07IFC001JF0IF803IFE00JFE1JF003JF01KF8N03IFE001JF803JF,001FFCI0FFC7CI03FF8K0PFEP07IFC001JF03FF003IFE007IFE1JF003JF81KFEN03IFE001JF003JF,001FFCI0FFC7CI03FF8K0QFO07JFC001JF01FC003IFE007IFE1JF803JF81LF8L07JFE001JF001JF,001FF8I0FFE7EI01FFCK0QF8L07LFC001JFL03IFE007IFE1JF801JF80LFCJ03LFE001JF001JF,003FF8I0FFE7EI01FFCK0QFCK03MFC001JFL03IFE003IFE1JF801JF80MFI01MFE001JF001JF,7JF8I0FFE7EI01JFEI0QFEK0NFC001JFL03IFE003IFE1JF801JF807LF8007MFE001JF001JF,KF8J0FE7EI01KFI0RFJ01NFC001JFL03IFE003IFE1JF801JF803LFC00NFE001JF001JF,KF8J07E7EJ0KFI0KF1LF8I03NFC001JFL03IFE003IFE1JF801JF801LFC01NFE001JF001JF,KF87IF7E7E7FE0KFI0JFE0LFCI07IF87IFC001JFL03IFE003IFC1JFC01JF8007KFE03IFC3IFE001JF001JF,KF07IF7E7E7FE0KFI0JFE07KFCI0JF07IFC003JFL03IFE003IFC1JFC01JFI03KFE07IF83IFE001JF001JF,KF07IF7E7E7FE0KFI0JFE03KFEI0IFE03IFC003JFL03JF003IFC1JFC01JFJ0LF07IF01IFE001JF001JF,KF83FF07E7E7FC0KFI0JFE01LF001IFE03IFC003JFL03JF003IF81JFE01JF07C03KF0JF01IFE001JF001JF,KF8J07E7EJ0KF001JFE00LF801IFE03IFE003JFL03JF003IF81JFE01IFE07E01KF0IFE01JF001JF003JF,KF8I0FFE7EI01KF001JFE007KFC01IFE03IFE003JFL03JF007IF00KF01IFE07F007JF0IFE03JF003JF003JF,7C3FF8I0FFE7EI01JFE001JFE003KFE01IFE07JF003JFL03JF007IF00KF01IFC07F803JF0JF03JF803JF003JF,003FF8I0FFE7EI01FFCJ03KF003LF81IFE07JFC07JF8K03JF007FFE007JFC3IFC07FC03JF0JF03JFE03JF803JF,001FF8I0FFE7EI01FFCJ03KF801LFE1JF0KFE0KFCK03JF00IFE007OF807FE03JF0JF87KF03JF803JF8,001FFCI0FFC7CI01FF8J07KFC00MF1PFE1LF8J07JF81IFC003OF007FF07IFE0QF07JF803JF8,001FFCI07FC7CI03FF8J0LFE007LF9PFE3LFCJ07JFC3IF8001NFE003MFE0PFE0KFC07JFC,001FFCI07FCFCI03FF8I01LFE003LF8PFC7LFEJ07OFI01NFC003MFC07OFE1KFE0KFE,00IFEI07FCFCI07FFEI01MF001LF8PF87LFEJ07NFEJ0NFI01MF807OFC1KFE1KFE,03IFEI07F8F8I07IF8001MF001LF87OF87LFEJ0383LF8J03LFEI01MF803OF81KFE1LF,1KFI03F9F8I0JFE001LFEI0LF83JF8JF03LFCL01LFK01LF8J0LFE001JFC7IF01KFE1KFE,3KFI03F9F8I0KF800LFCI07KF01IFE07FFC01LF8M07JFCL07JFEK07KFCI0JF03FFE00KFC0KFC,1KF8003F1FI01KFC003KFJ01JFI07FFC01FFI07JFEO0IFEN0JFL03KFJ03FFC01FF8003IFE003JF,1KFC001F3FI03KF8gG07CI078Y07EP07EP03EL03EI03C,1KFCI0E3FI03KF8,0KFEJ07EI07KF,0FF1IFJ0FCI0IF8FF,07C0IF8M01IF83F,0700IFEM03IF00E,J07IFM0IFE006,J07IFCK03IFE,J07JFK0JFE,I01KFCI03KF8,I03LFE07LFC,I07UFE,I0WF,001WFC,001FFE7OFE7FF8,I0FFC1OFC3FF,I07F80OF01FE,I03F00NFE00FC,I01E01OF0078,J0C01OF807,L03FF1IF8FF802,L07FF07FC0FFC,L07FE07FC07FE,L0FFE07FC07FF,K01FFC07FC03FF,L0FFC07FC03FF,L03F807FC01FC,M07807FC01E,M01007FC008,P07FC,P03FC,^FS\n" +
      "^FT110,100^A0N,33,32^FH\\^FDZımpara Taşı Sanayii A.Ş.^FS\n" +
      "^FT10,130^A0N,21,20^FH\\^FDTel:   +90 216 456 57 60^FS\n" +
      "^FT330,130^A0N,21,20^FH\\^FDKozyatağı Mahallesi Ankara^FS\n" +
      "^FT330,150^A0N,21,20^FH\\^FDAsfaltı 105 Evler^FS\n" +
      "^FT330,170^A0N,21,20^FH\\^FDHalk Sok.Sıddıklar İş^FS\n" +
      "^FT330,190^A0N,21,20^FH\\^FDMerkezi No.56 Kat.3^FS\n" +
      "^FT330,210^A0N,21,20^FH\\^FDKadıköy İstanbul^FS\n" +
      "^FT10,155^A0N,21,20^FH\\^FDFaks:+90 216 456 57 63^FS\n" +
      "^FT10,180^A0N,21,20^FH\\^FDhttp://www.partnera.com.tr^FS\n" +
      "^FT10,205^A0N,21,20^FH\\^FDbilgi@partnera.com.tr^FS\n" +
      "^FT10,230\n" +
      "^GB550,5,1,B^FS\n" +
      "^FT140,285^A0N,58,57^FH\\^FDÇEK ALINDISI^FS\n" +
      "^FT10,305\n" +
      "^GB550,5,1,B^FS\n" +
      "^FT330,340^A0N,33,32^FH\\^FDTarih:  06.12.2017^FS\n" +
      "^FT330,370^A0N,33,32^FH\\^FDSaat:          2017 12. Çeyrek^FS\n" +
      "^FT330,400^A0N,33,32^FH\\^FDNo:     000000020^FS\n" +
      "^FT10,402\n" +
      "^BY2,2,80\n" +
      "^B3N,80,N,N,N\n" +
      "^FD000000020^FS\n" +
      "^FT10,460^A0N,42,41^FH\\^FDÇek 01:^FS\n" +
      "^FT10,470\n" +
      "^GB550,1,1,B^FS\n" +
      "^FT10,510^A0N,33,32^FH\\^FDKeşide Eden:^FS\n" +
      "^FT210,510^A0N,29,28^FH\\^FDEren Derdiçok5^FS\n" +
      "^FT10,550^A0N,33,32^FH\\^FDBanka Adı:^FS\n" +
      "^FT210,550^A0N,29,28^FH\\^FDANADOLUBANK A.Ş.^FS\n" +
      "^FT10,590^A0N,33,32^FH\\^FDB. Şubesi:^FS\n" +
      "^FT210,590^A0N,29,28^FH\\^FDKartal^FS\n" +
      "^FT10,630^A0N,33,32^FH\\^FDB. Hesap No:^FS\n" +
      "^FT210,630^A0N,29,28^FH\\^FD1210^FS\n" +
      "^FT10,670^A0N,33,32^FH\\^FDÇek No:^FS\n" +
      "^FT210,670^A0N,29,28^FH\\^FD5858^FS\n" +
      "^FT10,710^A0N,33,32^FH\\^FDVade:^FS\n" +
      "^FT210,710^A0N,29,28^FH\\^FD26.10.2017^FS\n" +
      "^FT10,750^A0N,33,32^FH\\^FDTutar:^FS\n" +
      "^FT210,750^A0N,29,28^FH\\^FD12.500,00 TRY^FS\n" +
      "^FT10,830\n" +
      "^GB550,5,1,B^FS\n" +
      "^FT10,870^A0N,42,41^FH\\^FDToplam:^FS\n" +
      "^FT210,870^A0N,29,28^FH\\^FD1 Adet   12.500,00 TRY^FS\n" +
      "^FT10,910^A0N,21,20^FH\\^FD(On İki Bin Beş Yüz Lira)^FS\n" +
      "^FT10,960^A0N,25,24^FH\\^FDYukarıda dökümü yazılı 1 adet çek tahsil şartı ile müşterimizin^FS\n" +
      "^FT10,990^A0N,25,24^FH\\^FDnezdimizdeki hesaplarına alacak kaydedilmek üzere alınmıştır.^FS\n" +
      "^FT10,1020^A0N,25,24^FH\\^FD^FS\n" +
      "^FT10,1030^A0N,25,24^FH\\^FDMüşteri:^FS\n" +
      "^FT10,1060^A0N,25,24^FH\\^FDÖZKANLAR MAK.TİC.LTD.ŞTİ.^FS\n" +
      "^FT10,1120^A0N,25,24^FH\\^FDTemsilci, Adı, Soyadı:^FS\n" +
      "^FT10,1150^A0N,25,24^FH\\^FDFurkan S. Bulut^FS\n" +
      "^XZ\n";

  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterZsdk.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    Map<String, String> devices;
    try {
      devices = await FlutterZsdk.discoverBluetoothDevices();

      print('Testing');

      devices.forEach((k, v) {
        print('Device: $k [$v]');
      });
    } catch (e) {
      print('Error' + e);
    }

/*
    try {
      print('Testing with props: ' + devices.keys.first);

      Map<String, Map<String, String>> props;

      props = await FlutterZsdk.getDeviceProperties(devices.keys.first);

      props.forEach((k, v) {
        print("$k\t${v['set']}\t:${v['value']}");
      });
    } catch (e) {
      print('Hata' + e);
    }
*/
    try {
      print('Testing to write to : AC:3F:A4:5B:EB:1F with length of string ' + zplData.length.toString());

      await FlutterZsdk.sendZplOverBluetooth("AC:3F:A4:5B:EB:1F", zplData);
    } catch (e) {
      print('Hata' + e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
