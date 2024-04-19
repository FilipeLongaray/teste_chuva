import 'package:chuva_dart/view/home_page.dart';
import 'package:chuva_dart/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:chuva_dart/geral.dart';
import 'package:flutter_text_styled/flutter_text_styled.dart';
import 'package:from_css_color/from_css_color.dart';

import '../models/data.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage(this.data, {super.key});

  final Data data;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  MyTheme theme = MyTheme();
  bool favorite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo horizontalmente.
            children: [
              Container(
                width: 500,
                height: 100,
                color: theme.blue[400],
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: theme.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomePage(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 64,
                          ),
                          Text(
                            'Chuva ❤ Flutter',
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 500,
                height: 24,
                decoration: BoxDecoration(
                  color: fromCssColor(
                      widget.data.category?.color ?? '#fff'),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.data.category?.title?.ptBr ?? '',
                        style: TextStyle(
                          color: theme.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.data.title?.ptBr ?? 'Sem título',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        Text('Domingo 07:00h - 08:00h'),
                      ],
                    ),
                    Row(
                      children: [Icon(Icons.location_on), Text('Maputo')],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  favorite = !favorite;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(320, 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star),
                    const SizedBox(width: 8),
                    Text( favorite  ? 'Adicionar a sua agenda' : 'Remover da sua agenda'),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 32.0, left: 16, right: 16, bottom: 32),
                // child: Text( widget.data.description?.ptBr ?? ''),
                child: TextStyled(
                  textStyle: TextStyle(
                    color: Colors.black,
                  )
                ).getRichText(widget.data.description?.ptBr ?? '')
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    (widget.data.people ?? [])
                        .map((objeto) => objeto.role?.label?.ptBr ?? '')
                        .join(''),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(widget.data)),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Icon(Icons.people),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        children: [
                          Text('Stephen William Hawking'),
                          Text('Universidade de Cambridge'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
