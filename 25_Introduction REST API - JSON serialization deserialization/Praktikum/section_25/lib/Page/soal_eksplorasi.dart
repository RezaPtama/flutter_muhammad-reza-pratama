import 'package:dice_bear/dice_bear.dart';
import 'package:flutter/material.dart';


class SoalEksplorasi extends StatefulWidget {
  const SoalEksplorasi({Key? key}) : super(key: key);

  @override
  State<SoalEksplorasi> createState() => _SoalEksplorasiState();
}

class _SoalEksplorasiState extends State<SoalEksplorasi> {
  Avatar? _avatar;

  DiceBearSprite sprite = DiceBearSprite.any;
  String? seed;
  Color? background;
  int radius = 0;
  int? size;
  int scale = 100;
  bool flip = false;
  int rotate = 0;
  int translateX = 0;
  int translateY = 0;

  Widget avatar = DiceBearBuilder.withRandomSeed().build().toImage();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _buildAvatar();
  }

  void _buildAvatar() {
    setState(() {
      _avatar = controller.text.isEmpty
          ? DiceBearBuilder.withRandomSeed().build()
          : DiceBearBuilder(seed: controller.text).build();
    });
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      color: Colors.transparent,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Soal Eksplorasi"),
      ),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          children: [
            const Divider(height: 50),
            _AvatarView(_avatar),
            divider,
            SelectableText(
              _avatar?.svgUri.toString() ?? "",
              minLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Container(
              child: InputFieldWidget(controller: controller)
            ),
            ElevatedButton(
              onPressed: _buildAvatar, child: Text("Generate"))
          ],
        ),
      ),
    );
  }
}

class _AvatarView extends StatelessWidget {
  final Avatar? avatar;

  const _AvatarView(this.avatar, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        color: Colors.white,
      ),
      child: avatar?.toImage(
            width: 150,
            height: 150,
            clipBehavior: Clip.none,
          ) ??
          Container(),
    );
  }
}


class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: TextFormField(
        
        controller: controller,
        decoration: InputDecoration(
          labelText: "Input Seed",
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: 'Input seed (Optional)',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          ),
          // enabledBorder: OutlineInputBorder(
          //   gapPadding: 0.0,
          //   borderRadius: BorderRadius.circular(8),
          //   borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   gapPadding: 0.0,
          //   borderRadius: BorderRadius.circular(8),
          //   borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
          // ),
        ),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
      ),
    );
  }
}