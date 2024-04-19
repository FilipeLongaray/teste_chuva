import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:intl/intl.dart';
import '../geral.dart';
import 'package:dio/dio.dart';

import '../models/data.dart';
import '../models/response_default.dart';
import 'description_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyTheme theme = MyTheme();
  final dio = Dio();
  ResponseDefault? responseDefault;

  @override
  void initState() {
    buscaDados();
    buscaDados2();
    super.initState();
  }

  void buscaDados() async {
    Response response = await dio.get(
        'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json');
    if (response.statusCode == 200) {
      // List<dynamic> jsonList = response.data;
      //
      //
      // List<User> users = jsonList.map((item) => User.fromJson(item)).toList();
      responseDefault = ResponseDefault.fromJson(json.decode(response.data));
      setState(() {});
    } else {
      print('Erro na requisição: ${response.statusCode}');
    }
    print(response);
  }

  void buscaDados2() async {
    Response response = await dio.get(
        'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities-1.json');
    if (response.statusCode == 200) {
      // List<dynamic> jsonList = response.data;
      //
      //
      // List<User> users = jsonList.map((item) => User.fromJson(item)).toList();
      responseDefault = ResponseDefault.fromJson(json.decode(response.data));
      setState(() {});
    } else {
      print('Erro na requisição: ${response.statusCode}');
    }
    print(response);
  }

  String formatarHorario(DateTime inicio, DateTime fim) {
    DateFormat dateFormat = DateFormat('HH:mm');
    String horaInicio = dateFormat.format(inicio);
    String horaFim = dateFormat.format(fim);
    return '$horaInicio até $horaFim';
  }

  Widget customElevatedButton({
    required VoidCallback onPressed,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(4, 32)),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: 500,
              height: 180,
              color: theme.blue[400],
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: theme.white,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Chuva ❤ Flutter',
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Programação',
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: const ShapeDecoration(
                            color: Colors.lightBlue,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.calendar_month),
                            color: Colors.black,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Exibindo todas as atividades',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      'Nov',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold, // Adiciona negrito ao texto
                      ),
                    ),
                    Text(
                      '2023',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold, // Adiciona negrito ao texto
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 324,
                  height: 48,
                  color: theme.blue[400],
                  child: Row(
                    children: [
                      customElevatedButton(onPressed: () {}, text: '26'),
                      customElevatedButton(onPressed: () {}, text: '27'),
                      customElevatedButton(onPressed: () {}, text: '28'),
                      customElevatedButton(onPressed: () {}, text: '29'),
                      customElevatedButton(onPressed: () {}, text: '30'),
                    ],
                  ),
                ),
              ],
            ),
            responseDefault?.data == null
                ? const Text('sem dados')
                : Expanded(
                    child: ListView.builder(
                        itemCount: responseDefault!.data!.length,
                        itemBuilder: (context, index) {
                          Data data = responseDefault!.data![index];
                          return Card(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 8, right: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                border: Border(
                                    left: BorderSide(
                                        color: fromCssColor(
                                            data.category?.color ?? '#fff'),
                                        width: 5.0)),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DescriptionPage(data)),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            '${data.type?.title?.ptBr ?? ''} de ${formatarHorario(
                                                    data.start!, data.end!)}',
                                            style: const TextStyle(
                                              fontSize: 10,
                                            )),
                                      ],
                                    ),
                                    Text(data.title?.ptBr ?? ''),
                                    Text(
                                      (data.people ?? [])
                                          .map((objeto) => objeto.name)
                                          .join(', '),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
