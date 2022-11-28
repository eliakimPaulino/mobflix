import 'package:flutter/material.dart';
import 'package:mobflix/components/card_presentation.dart';
import 'package:mobflix/components/video_preview.dart';
import 'package:mobflix/data/video_dao.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    Key? key,
    required this.customTextFildContext,
  }) : super(key: key);

  final BuildContext customTextFildContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _myController = TextEditingController();
  final TextEditingController _dropMenuController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _myController.dispose();
    _dropMenuController.dispose();
    super.dispose();
  }

  String? value;
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
                        VideoDao().save(
                          CardPresentation(
                            url: _myController.text,
                            index: indexToPass,
                          ),
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Adicionar'),
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
      decoration: const InputDecoration(
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
    'UX&UI DESIGN_',
    'OUTROS_',
  ];

  Widget dropMenu() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: const Color.fromRGBO(5, 25, 51, 1),
        hint: const Text(
          'Selecionar Categoria   ',
          style: TextStyle(
            color: Color.fromRGBO(254, 185, 5, 1),
          ),
        ),
        isExpanded: false,
        items: categorys.map(buildMenuCategory).toList(),
        value: value,
        onChanged: (value) {
          _dropMenuController.text = value.toString();
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
