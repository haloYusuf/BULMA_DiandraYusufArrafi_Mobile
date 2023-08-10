import 'package:flutter/material.dart';
import 'package:project_akhir_seleksi_itc/models/krs_data.dart';

class HomeTableView{

  List<TableRow> getTableView(List<KRSData> data){
    List<TableRow> listData = [];
    listData.add(_headerContent());
    for(var i in data){
      listData.add(
        _tableContent(i)
      );
    }
    return listData;
  }

  TableRow _tableContent(KRSData i){
    return TableRow(
      children: [
        _tableValue(i.matakuliah),
        _tableValue(i.hari),
        _tableValue(i.namaDosen),
      ]
    );
  }

  TableRow _headerContent(){
    return TableRow(
      children: [
        _headerValue('Mata Kuliah'),
        _headerValue('Hari'),
        _headerValue('Nama Dosen'),
      ]
    );
  }

  Container _tableValue(String content){
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.transparent,
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  Container _headerValue(String title){
    return Container(
      margin: const EdgeInsets.all(7),
      color: Colors.transparent,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}