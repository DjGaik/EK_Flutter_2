import 'package:flutter/material.dart';
import 'package:flutter_2/main.dart';

class AboutPage extends StatefulWidget {
  final CardInfo cardInfo;
  const AboutPage({Key? key, required this.cardInfo}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late TextEditingController controller;
  late CardInfo cardInfo2;

  @override
  void initState() {
    cardInfo2 = CardInfo(
      title: widget.cardInfo.title,
      id: widget.cardInfo.id,
      imageUrl: widget.cardInfo.imageUrl,
    );

    initController();
    super.initState();
  }

  void initController() {
    controller = TextEditingController(text: cardInfo2.title);
  }

  void save() {
    cardInfo2.title = controller.text;
  }

  Future<bool?> _showAlertDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Постривай!'),
          content: const Text('Хочешь зберегти зміни?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ні'),
              onPressed: () {
                Navigator.of(context).pop(false);
                Navigator.of(context).pop(widget.cardInfo);
              },
            ),
            TextButton(
              child: const Text('Так'),
              onPressed: () {
                save();
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(cardInfo2);
              },
            ),
          ],
        );
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showAlertDialog();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AboutPage'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      widget.cardInfo.imageUrl,
                      width: double.infinity,
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: controller,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    save();
                    Navigator.of(context).pop(cardInfo2);
                  },
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
