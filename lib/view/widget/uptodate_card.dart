part of 'widgets.dart';

class UpToDateCard extends StatelessWidget {
  final Color beginColor;
  final Color endColor;
  final String image;
  final String title;
  final String description;

  UpToDateCard(this.beginColor, this.endColor, this.image, this.title,
      this.description);

  @override
  Widget build(BuildContext context) {
    return Parent(style: ParentStyle()
      ..padding(all: 12)
      ..borderRadius(all: 10)
      ..linearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [beginColor, endColor]),

      //========image and content slide
      child: Row(
        children: [
          SizedBox(
            height: 82,
            width: 82,
            child: Image.asset(image, fit: BoxFit.cover,),
          ),
          //  ====== spacing
          SizedBox(
            width: 10,
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontFamily: 'AirBnB',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),),
              Text(title, style: TextStyle(fontFamily: 'AirBnB',
                  fontSize: 14,
                  fontWeight: FontWeight.normal),)
            ],
          ))
        ],
      ),

    );
  }
}
