import 'package:flutter/material.dart';
import 'package:project_akhir_seleksi_itc/models/input_data.dart';
import 'package:project_akhir_seleksi_itc/models/login_data.dart';
import 'package:project_akhir_seleksi_itc/pages/home/home_table_view.dart';

import '../../models/krs_data.dart';

final List<KRSData> _dataKrs = [];

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text(
          'BULMA',
          style: TextStyle(
            color: Color(0xFF495057),
            fontSize: 16,
            fontFamily: 'REM',
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: (){},
              child: Text(
                LoginData.nim,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: const [
          _HomeContentView(),
        ],
      ),
    );
  }
}

class _HomeContentView extends StatefulWidget {
  const _HomeContentView({super.key});

  @override
  State<_HomeContentView> createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<_HomeContentView> {

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 1 / 15,
          left: MediaQuery.of(context).size.width * 1 / 12,
          right: MediaQuery.of(context).size.width * 1 / 12,
          bottom: 30,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: (){
                  _showBottomModal(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF495057),
                ),
                child: const Text(
                  'Input KRS',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Table(
                border: TableBorder.all(color: Colors.black),
                children: HomeTableView().getTableView(_dataKrs),
              )
            ],
          ),
        )
    );
  }

  _showBottomModal (context){

    String? selectedDay, selectedMatkul, selectedDosen;
    bool validateDay = true, validateMatkul = true, validateDosen = true;

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context){
        return Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 1 / 2,
              child: StatefulBuilder(
                builder: (BuildContext c, setState){
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Input KRS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              validateDay = selectedDay != null;
                              validateMatkul = selectedMatkul != null;
                              validateDosen = selectedDosen != null;
                              if(!validateDay || !validateDosen || !validateMatkul){

                              }else if(validateDay && validateDosen && validateMatkul){
                                this.setState(() {
                                  _dataKrs.add(
                                    KRSData(matakuliah: selectedMatkul!, hari: selectedDay!, namaDosen: selectedDosen!)
                                  );
                                  Navigator.pop(this.context);
                                });
                              }
                            },
                            child: const Text(
                              'SAVE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            DropdownButtonFormField(
                              items: InputData.dayData.map((e){
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (e){
                                if(e != null){
                                  setState((){
                                    selectedDay = e;
                                  });
                                }
                              },
                              value: selectedDay,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Hari',
                                errorText: validateDay ? null : 'Wajib memasukkan data hari.',
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2)
                                ),
                                prefixIcon: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.black54,
                                  size: 20,
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DropdownButtonFormField(
                              items: InputData.matkulData.map((e){
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (e){
                                if(e != null){
                                  setState((){
                                    selectedMatkul = e;
                                  });
                                }
                              },
                              value: selectedMatkul,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Matkul',
                                errorText: validateMatkul ? null : 'Wajib memasukkan data matkul.',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2)
                                ),
                                prefixIcon: const Icon(
                                  Icons.subject,
                                  color: Colors.black54,
                                  size: 20,
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DropdownButtonFormField(
                              items: InputData.dosenData.map((e){
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (e){
                                if(e != null){
                                  setState((){
                                    selectedDosen = e;
                                  });
                                }
                              },
                              value: selectedDosen,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Dosen',
                                errorText: validateDosen ? null : 'Wajib memasukkan data dosen.',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2)
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.black54,
                                  size: 20,
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              )
          ),
        );
      },
    );
  }
}