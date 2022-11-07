// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;
import 'package:mobflix/components/card_presentation.dart';

import '../components/horizontal_categorys.dart';

class VideoReagistration extends StatefulWidget {
  const VideoReagistration({Key? key}) : super(key: key);

  @override
  State<VideoReagistration> createState() => _VideoReagistrationState();
}

class _VideoReagistrationState extends State<VideoReagistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // constraints: const BoxConstraints(maxWidth: 515),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(12, 67, 136, 1),
              Color.fromRGBO(12, 67, 136, 1),
              Color.fromRGBO(5, 25, 51, 1),
            ],
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(),
                MyCustomTextFild(
                  labelText: 'URL',
                  hintText: 'EX.: https://youtube.com/c/Alura',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          height: 175,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: 10,
                // top: 5,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(254, 185, 5, 1),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Cadastre um vídeo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(254, 185, 5, 1),
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

class MyCustomTextFild extends StatefulWidget {
  MyCustomTextFild({Key? key, required this.labelText, required this.hintText})
      : super(key: key);
  final String labelText;
  final String hintText;
  final TextEditingController _controllerURL = TextEditingController();
  // final DropdownMenuItem _controllerCategory;
  String? value;

  @override
  State<MyCustomTextFild> createState() => _MyCustomTextFildState();
}

class _MyCustomTextFildState extends State<MyCustomTextFild> {
  final formKey = GlobalKey<FormState>();
  String url = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) => setState(() {
                url = value!;
              }),
              // validator: (value) {
              //   if (value?.length != null) {
              //     return value;
              //   } else {
              //     return 'Digite um URL';
              //   }
              // },
              cursorColor: const Color.fromRGBO(254, 185, 5, 1),
              decoration: InputDecoration(
                hintText: widget.hintText,
                labelText: widget.labelText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(254, 185, 5, 1), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(254, 185, 5, 1), width: 3),
                ),
              ),
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.go,
            ),
            const SizedBox(height: 16),
            // const TechCategory(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
              child: _listCategoryCard(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final isValid = formKey.currentState?.validate();
                if (isValid!) {
                  formKey.currentState?.save();
                }
              },
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Preview',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(254, 185, 5, 1),
                  ),
                ),
                SizedBox(),
              ],
            ),
            Visibility(
              visible: formKey.currentState?.validate() != null,
              child: Column(
                children: [
                  VideoPreview(url: url),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // TechCategory().buildMenuCategory().value;
                    },
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // void _addVideoToList(BuildContext context) {
  //   final controllerURL = widget._controllerURL.text;
  //   final controllerCatogory = widget.value;
  //   if (controllerURL != null && controllerCatogory != null) {
  //     final dataToList = CardPresentation(
  //       url: controllerURL,
  //       categoryContainer: controllerCatogory,
  //     );
  //   }
  // }

  // Criação do DropDownMenu por categoria
  Widget _listCategoryCard() {
    final categorys = [
      'MOBILE_',
      'DEVOPS_',
      'PROGRAMAÇÃO_',
      'DATA SCIENCE_',
      'FRONT-END_',
      'UX&UI DESIGN_'
    ];

    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        dropdownColor: const Color.fromRGBO(5, 25, 51, 1),
        hint: const Text('Selecionar Categoria   ',
            style: TextStyle(color: Color.fromRGBO(254, 185, 5, 1))),
        isExpanded: true,
        items: categorys.map(buildMenuCategory).toList(),
        value: widget.value,
        onChanged: (value) => setState(() => widget.value = value),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuCategory(String category) {
    return DropdownMenuItem(
      alignment: AlignmentDirectional.centerStart,
      value: category,
      child: Text(
        category,
        style: const TextStyle(color: Color.fromRGBO(254, 185, 5, 1)),
      ),
    );
  }
}

class TechCategory extends StatefulWidget {
  const TechCategory({Key? key}) : super(key: key);

  @override
  State<TechCategory> createState() => TechCategoryState();
}

class TechCategoryState extends State<TechCategory> {
  final categorys = [
    'MOBILE_',
    'DEVOPS_',
    'PROGRAMAÇÃO_',
    'DATA SCIENCE_',
    'FRONT-END_',
    'UX&UI DESIGN_'
  ];

  String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        dropdownColor: const Color.fromRGBO(5, 25, 51, 1),
        hint: const Text('Selecionar Categoria   ',
            style: TextStyle(color: Color.fromRGBO(254, 185, 5, 1))),
        isExpanded: false,
        items: categorys.map(buildMenuCategory).toList(),
        value: value,
        onChanged: (value) => setState(() => this.value = value),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuCategory(String category) {
    return DropdownMenuItem(
      alignment: AlignmentDirectional.center,
      value: category,
      child: Text(
        category,
        style: const TextStyle(color: Color.fromRGBO(254, 185, 5, 1)),
      ),
    );
  }
}

class VideoPreview extends StatefulWidget {
  const VideoPreview({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  Map<String, PreviewData> datas = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 08.0, 24.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            // key: ValueKey(widget.url),
            margin: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color(0xfff7f7f8),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: LinkPreview(
                onPreviewDataFetched: (data) {
                  setState(() {
                    datas = {
                      ...datas,
                      widget.url: data,
                    };
                  });
                },
                previewData: datas[widget.url],
                text: widget.url,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
