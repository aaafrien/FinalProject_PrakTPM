import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/model/quotes_lib.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import '../boxes.dart';

class AddQuote extends StatefulWidget {
  const AddQuote({Key? key}) : super(key: key);

  @override
  State<AddQuote> createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  String _imagePath = "";
  final ImagePicker _picker = ImagePicker();
  Future<String> getImage(bool isCamera) async {
    final XFile? image;
    if (isCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }
    return image!.path;
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _quoteController = TextEditingController();

  late Box<Quote> _quoteLib;

  @override
  void initState() {
    super.initState();
    _quoteLib = Hive.box<Quote>(HiveBoxes.quote);
  }

  @override
  void dispose() {
    _authorController.dispose();
    _quoteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Quote'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                _authorField(),
                SizedBox(height: 15),
                _quotesField(),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _quoteLib.add(Quote(
                          author: _authorController.text,
                          quotes: _quoteController.text,
                          time: DateTime.now()));
                      _quoteController.clear();
                      _authorController.clear();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/navbar', (route) => false);
                    }
                  },
                  child: Text("Add Quote",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _authorField() {
    return TextFormField(
      controller: _authorController,
      decoration: InputDecoration(
        labelText: 'Author',
        hintText: 'author',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Author is Required';
        }
        return null;
      },
    );
  }

  Widget _quotesField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: _quoteController,
      decoration: InputDecoration(
        labelText: 'Quote',
        hintText: 'quote',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Quote is Required';
        }
        return null;
      },
    );
  }
}
