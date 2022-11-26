import 'package:flutter/material.dart';
import 'package:mobflix/components/video_preview.dart';

import '../data/card_data.dart';

class MyCustomTextFild extends StatefulWidget {
  const MyCustomTextFild({
    Key? key,
    required this.customTextFildContext,
  }) : super(key: key);

  final BuildContext customTextFildContext;

  @override
  State<MyCustomTextFild> createState() => _MyCustomTextFildState();
}

class _MyCustomTextFildState extends State<MyCustomTextFild> {
  final TextEditingController _myController = TextEditingController();
  final TextEditingController _dropMenuController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    _dropMenuController.dispose();
    super.dispose();
  }

  String? value;
  final _formKey = GlobalKey<FormState>();
  String url = '';
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: textFormField(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: dropMenu(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    url = _myController.text;
                    visible = true;
                  });
                },
                child: const Text('Buscar'),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Preview',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(254, 185, 5, 1),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: visible,
              // visible: _formKey.currentState?.validate() != null,
              child: Column(
                children: [
                  VideoPreview(url: url),
                  ElevatedButton(
                    onPressed: () {
                      int indexToPass = 0;
                      categorys.asMap().forEach(
                        (index, value) {
                          if (value == _dropMenuController.text) {
                            setState(() {
                              indexToPass = index;
                            });
                          }
                        },
                      );
                      if (_formKey.currentState!.validate()) {
                        CardInheritedData.of(widget.customTextFildContext)!
                            .newCard(_myController.text, indexToPass);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFormField() {
    return TextFormField(
      controller: _myController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite uma URL válida';
        }
        return null;
      },
      cursorColor: const Color.fromRGBO(254, 185, 5, 1),
      decoration: InputDecoration(
        hintText: 'URL',
        labelText: 'Digite uma URL do Youtube',
      ),
    );
  }

  final categorys = [
    'MOBILE_',
    'DEVOPS_',
    'PROGRAMAÇÃO_',
    'DATA SCIENCE_',
    'FRONT-END_',
    'UX&UI DESIGN_'
  ];

  Widget dropMenu() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: const Color.fromRGBO(5, 25, 51, 1),
        hint: const Text('Selecionar Categoria   ',
            style: TextStyle(color: Color.fromRGBO(254, 185, 5, 1))),
        isExpanded: false,
        items: categorys.map(buildMenuCategory).toList(),
        value: value,
        onChanged: (value) {
          _dropMenuController.text = value.toString();
          // _dropMenuController.text = value.toString();
          setState(() => this.value = value);
        },
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
