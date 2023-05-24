import 'package:flutter/material.dart';
import 'package:flutter_2/main.dart';

class CustomCard extends StatelessWidget {
  final CardInfo cardInfo;
  final VoidCallback onTap;

  const CustomCard ({Key? key, required this.cardInfo, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buttonSection =  Container(
      width: 180,
      height: 70,
      alignment: Alignment.center,
      color: Colors.white.withOpacity(0.8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BuildButtonColumn(
              Colors.blue,
              Icons.call,
              'CALL'
          ),
          _BuildButtonColumn(
              Colors.green,
              Icons.near_me,
              'ROUTE'
          ),
          _BuildButtonColumn(
              Colors.black,
              Icons.share,
              'SHARE'
          ),
        ],
      ),
    );

    Widget titleSection = Container(
      height: 115,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.85),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    cardInfo.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text(
            '41',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    return Stack(
      children: [
        Image.asset(
          cardInfo.imageUrl,
          width: double.infinity,
          height: 270,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 16,
          left: 16,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.85),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '# ${cardInfo.id}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          top: 16,
          right: 16,
          child: buttonSection,
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: titleSection,
        ),
      ],
    );
  }
}

class _BuildButtonColumn extends StatelessWidget {
  const _BuildButtonColumn(this.color, this.icon, this.label, {Key? key})
      : super(key: key);

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
