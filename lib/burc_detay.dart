import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    apparRenginiBul();
    //_generator = PaletteGenerator.fromImageProvider(AssetImage(assetName),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          centerTitle: true,
          backgroundColor: appbarRengi,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              widget.secilenBurc.burcAdi + " Burcu ve Özellikleri",
              style: TextStyle(color: Colors.white),
            ),
            background: Image.asset(
              'images/' + widget.secilenBurc.burcBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          // Sliver kullandığım için singlechilde izin vermediği için sliver görünümlü box kullandık scrollview kullanmak için
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ],
    ));
  }

  void apparRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage('images/${widget.secilenBurc.burcBuyukResim}'),
    );
    appbarRengi = _generator.dominantColor!.color;
    setState(() {});
    print(appbarRengi);
  }
}
