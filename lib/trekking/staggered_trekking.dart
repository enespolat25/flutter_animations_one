import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutteranimationsone/trekking/staggered_trekking_enter_animation.dart';

class StaggeredTrekking extends StatelessWidget {
  StaggeredTrekking({
    Key key,
    @required AnimationController controller,
  })  : animation = StaggeredTrekkingEnterAnimation(controller),
        super(key: key);
  final StaggeredTrekkingEnterAnimation animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE1F0F4),
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: (context, child) => _buildAnimation(context, child, size),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child, Size size) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                topBar(animation.barHeight.value),
                circle(
                  size,
                  animation.avatarSize.value,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Opacity(
                  opacity: animation.titleOpacity.value,
                  child: placeholderBox(28, 150, Alignment.centerLeft),
                ),
                SizedBox(height: 6),
                Opacity(
                  opacity: animation.textOpacity.value,
                  child: placeholderBox1(
                      250, double.infinity, Alignment.centerLeft),
                ),
                SizedBox(height: 6),
                Opacity(
                  opacity: animation.imageOpacity.value,
                  child: placeholderBox2(Alignment.center),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      //color: Colors.blue,
      child: Image.asset(
        "assets/pic3.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 100,
      left: size.width / 2 - 50,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          animationValue,
          animationValue,
          1.0,
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.shade300,
            image: DecorationImage(image: AssetImage("assets/avtar.jpg")),
          ),
        ),
      ),
    );
  }

  Align placeholderBox(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFD5EBEC),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            "Ahmet Çağan Polat",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Align placeholderBox1(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 490,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFC7E4E9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("1. Ahmet Çağan suyla oynamayı çok sever.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Text("2. Makarna ve pilava bayılır.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Text("3. Her sabah erkencidir. Saat 6 da ayaktadır.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Text("4. Maşa ve Koca Ayıyı kahkahalarla izler.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Text("5. Anne babasına çok düşkündür.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Text("6. Arabesk bir şarkı dinleyince gözlerinden yaş gelir.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Text("7. Arkadaşlarıyla oyuncaklarını paylaşır.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 100,
                  width: width,
                  child: Image.asset(
                    "assets/baby2.jpg",
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("8. Saklanbaç oynamak, kağıtları karalamak hobileridir.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Text("9. Karpuz en sevdiği meyvedir.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Text("10. Ekşi yemekten hoşlanır.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 100,
                  width: width,
                  child: Image.asset(
                    "assets/baby.jpg",
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildImage(String imgPath) {
    return Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: Container(
            height: 50.0,
            width: 115.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.cover))));
  }

  Widget placeholderBox2(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
          height: 70.0,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            _buildImage('assets/images.jpg'),
            _buildImage('assets/images1.jpg'),
            _buildImage('assets/images2.jpg')
          ])),
    );
  }
}
