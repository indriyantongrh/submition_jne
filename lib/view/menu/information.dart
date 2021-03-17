import 'package:flutter/material.dart';
import 'package:bms_mobile/view/widget/widgets.dart';

class Belanja extends StatefulWidget {
  @override
  _BelanjaState createState() => _BelanjaState();
}

class _BelanjaState extends State<Belanja> {
  PageController controller = PageController(initialPage: 0, viewportFraction: 0.8);

  List<Widget> informasi = [
    InformationboxVerical(
      urlImage:
      "https://akcdn.detik.net.id/community/media/visual/2021/01/13/presiden-jokowi-setelah-disuntik-vaksin-corona-5_43.jpeg?w=700&q=90",
      title: "Ada 30 Ribu Vaksinator, Jokowi Targetkan Vaksinasi COVID Rampung Setahun",
    ),
    InformationboxVerical(
      urlImage:
      "https://akcdn.detik.net.id/community/media/visual/2021/01/24/bakamla-amankan-2-kapal-tanker-asing-di-perairan-pontianak_169.jpeg?w=700&q=90",
      title: "Bakamla Amankan 2 Kapal Tanker Asing di Perairan Pontianak",
    ),
    InformationboxVerical(
      urlImage:
      "https://akcdn.detik.net.id/community/media/visual/2020/11/14/gubernur-bali-i-wayan-koster-1_43.jpeg?w=700&q=90",
      title: "Viral Acara PDIP Bali Tiup Lilin Buka Masker dan Suap-suapan Satu Sendok",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Column(

        children: [

          Expanded(

            child: PageView.builder(
              scrollDirection: Axis.vertical,
                controller: controller,
                itemCount: informasi.length,
                itemBuilder: (context, index) =>
                    Container(
                      ///margin: (left),
                      child: informasi[index],
                    )),
          ),
        ],
      )
    );
  }
}
