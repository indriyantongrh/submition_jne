part of 'widgets.dart';

class Informationbox extends StatelessWidget {
  final String urlImage;
  final String urlFlag;
  final String title;
  final String city;
  final String number;

  Informationbox(
      {this.urlImage, this.urlFlag, this.title, this.city, this.number});

  @override
  Widget build(BuildContext context) {
    return
      Parent(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Get.toNamed('/second');
            },
            child:
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, color: Colors.black.withOpacity(0.5))
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(urlImage), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,

                  style: TextStyle(
                      fontFamily: 'AirBnB',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
      style: parentStyle,
    );
  }
}
