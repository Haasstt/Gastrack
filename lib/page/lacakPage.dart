// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:gastrack/provider/TransaksiProvider.dart';
import 'package:shimmer/shimmer.dart';

class LacakPage extends StatefulWidget {
  const LacakPage({super.key, required this.id});

  final int id;

  @override
  State<LacakPage> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<LacakPage> {
  List<Map<String, dynamic>> DataLokasi = [];
  late var id = widget.id.toInt();
  // bool _notResponding = false;
  // var message = "";

  @override
  void initState() {
    TransaksiProvider().getDatalokasi(id).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['data'];
        for (var element in data) {
          setState(() {
            DataLokasi.add(element);
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 122, 122)
                        .withOpacity(0.15), // Warna bayangan
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(71, 109, 109, 109)
                          .withOpacity(0.15),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Lacak lokasi Kurir',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 122, 122, 122)
                          .withOpacity(0.15), // Warna bayangan
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: DataLokasi.map((index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            "assets/icon/icon_trip.png",
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${(index['keterangan'])} [${(index['waktu'])}]',
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingContentDetail extends StatelessWidget {
  const LoadingContentDetail(
      {super.key, required this.width, required this.height});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: MediaQuery.of(context).size.height * height,
                width: MediaQuery.of(context).size.width * width,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingHeaderdetail extends StatelessWidget {
  const LoadingHeaderdetail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 50),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                      ],
                    ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
