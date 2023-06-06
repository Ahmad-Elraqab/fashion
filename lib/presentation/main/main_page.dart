import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/base/app/config/app_constants.dart';
import 'dart:math' as math;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation _animation2;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween(begin: 200.0, end: 270.0).animate(_controller);
    _animation2 =
        ColorTween(begin: Colors.transparent, end: body.withOpacity(.7))
            .animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.forward();
    });

    super.initState();
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: offWhite,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: offWhite),
      ),
      body: Container(
        color: offWhite,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(height: 70.0, color: lightBlue),
                  MainPageHeader(
                    controller: _controller,
                    animation: _animation,
                    animation2: _animation2,
                  ),
                  MainPageNewArrival(scrollController: scrollController),
                  MainPageCollection(scrollController: scrollController),
                  const MainPageJustForYou(),
                  MainPageTrending(scrollController: scrollController),
                  MainPageFollowUs(scrollController: scrollController),
                ],
              ),
            ),
            const CustomAppBar(),
          ],
        ),
      ),
    );
  }
}

class MainPageFollowUs extends StatelessWidget {
  const MainPageFollowUs({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40.0),
        Text(
          'FOLLOW US',
          style: title,
        ),
        const SizedBox(height: 10.0),
        Image.asset(
          'lib/assets/images/Instagram.png',
          height: 24,
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            controller: scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 165,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => Align(
              alignment: index == 0 || index == 2
                  ? Alignment.topRight
                  : Alignment.topLeft,
              child: Container(
                // margin: EdgeInsets.all(14.0),
                child: Stack(
                  children: [
                    Image.asset(
                      'lib/assets/images/d${index + 1}.png',
                      scale: 4,
                    ),
                    Positioned(
                      left: 9,
                      bottom: 12,
                      child: Text(
                        '@_jihyn',
                        style: getStyle(1.0, 1.0, 14.0, offWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 162.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i in ['Twitter', 'Instagram', 'YouTube'])
                SvgPicture.asset('lib/assets/icons/$i.svg'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomPaint(
          size: const Size(125, 10),
          painter: RPSCustomPainter(),
        ),
        const SizedBox(height: 24),
        Text(
          'support@openui.design',
          style: getStyle(2.0, 1.0, 16.0, body),
        ),
        Text(
          '+60 825 876',
          style: getStyle(2.0, 1.0, 16.0, body),
        ),
        Text(
          '08:00 - 22:00 - Everyday',
          style: getStyle(2.0, 1.0, 16.0, body),
        ),
        const SizedBox(height: 24),
        CustomPaint(
          size: const Size(125, 10),
          painter: RPSCustomPainter(),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 290.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About',
                style: getStyle(2.0, 1.0, 16.0, titleActive),
              ),
              Text(
                'Contact',
                style: getStyle(2.0, 1.0, 16.0, titleActive),
              ),
              Text(
                'Blog',
                style: getStyle(2.0, 1.0, 16.0, titleActive),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          color: gy.withOpacity(.3),
          padding: const EdgeInsets.only(top: 12.0, bottom: 15.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Copyright© OpenUI All Rights Reserved.',
              style: getStyle(1.0, 1.0, 12.0, label),
            ),
          ),
        ),
      ],
    );
  }
}

class MainPageTrending extends StatelessWidget {
  const MainPageTrending({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Text(
                '@TRENDING',
                style: title,
              ),
              const SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  for (var i in [
                    '#2021',
                    '#spring',
                    '#collection',
                    '#fall',
                    '#dress',
                    '#autumncollection',
                    '#openfashion',
                  ])
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: inputBackground,
                      ),
                      child: Text(
                        i,
                        style: getStyle(1.0, 1.0, 14.0, body),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 37.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 28.0),
          width: double.infinity,
          color: cardBg,
          child: Column(
            children: [
              SvgPicture.asset('lib/assets/icons/Logo.svg'),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 300.0,
                child: Text(
                  'Making a luxurious lifestyle accessible for a generous group of women is our daily drive.',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: getStyle(1.5, 1.0, 14.0, label),
                ),
              ),
              const SizedBox(height: 14.0),
              CustomPaint(
                size: const Size(125, 10),
                painter: RPSCustomPainter(),
              ),
              const SizedBox(height: 14.0),
              SizedBox(
                height: 220,
                child: GridView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 110,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/c${index + 1}.png',
                        scale: 4,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Fast shipping. Free on orders over \$25.',
                        textAlign: TextAlign.center,
                        style: getStyle(1.5, 1.0, 13.0, label),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Image.asset(
                'lib/assets/images/c5.png',
                scale: 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MainPageJustForYou extends StatelessWidget {
  const MainPageJustForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'JUST FOR YOU',
          style: title,
        ),
        const SizedBox(height: 8.0),
        CustomPaint(
          size: const Size(125, 10),
          painter: RPSCustomPainter(),
        ),
        const SizedBox(height: 23.0),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 6.0),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 10.0),
                width: 255.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'lib/assets/images/R${index + 1}.png',
                        height: 312,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '21WN reversible angora cardigan',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: getStyle(1.5, 1.0, 16.0, body),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '\$120',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: getStyle(1.0, 1.0, 16.0, secondary),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < 3; i++)
              Transform.rotate(
                angle: -40.0,
                child: Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  width: 5.66,
                  height: 5.66,
                  decoration: BoxDecoration(
                    color: i == 0 ? placeholder : Colors.transparent,
                    border: Border.all(
                      color: placeholder,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}

class MainPageCollection extends StatelessWidget {
  const MainPageCollection({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45.0),
        CustomPaint(
          size: const Size(125, 10),
          painter: RPSCustomPainter(),
        ),
        const SizedBox(height: 27.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: GridView.builder(
            controller: scrollController,
            itemCount: 6,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 28.16,
              crossAxisCount: 3,
              mainAxisSpacing: 30.0,
            ),
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    'lib/assets/images/B${index + 1}.png',
                    scale: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 27.0),
        CustomPaint(
          size: const Size(125, 10),
          painter: RPSCustomPainter(),
        ),
        const SizedBox(height: 60.0),
        Text(
          'COLLECTIONS',
          style: title,
        ),
        const SizedBox(height: 15.5),
        SizedBox(
          height: 270.0,
          child: Stack(
            children: [
              Image.asset(
                'lib/assets/images/Frame 2.png',
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          height: 296,
          width: 260,
          child: Stack(
            children: [
              Image.asset(
                'lib/assets/images/image 9.png',
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 72),
          child: Stack(
            children: [
              Image.asset(
                'lib/assets/images/Video.png',
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MainPageNewArrival extends StatelessWidget {
  const MainPageNewArrival({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 35.42),
          Text(
            'NEW ARRIVAL',
            style: title,
          ),
          const SizedBox(height: 4.0),
          CustomPaint(
            size: const Size(125, 10),
            painter: RPSCustomPainter(),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i in ['All', 'Apparel', 'Dress', 'TShirt', 'Bag'])
                Container(
                  margin: EdgeInsets.only(
                      right: i == 'TShirt'
                          ? 22
                          : i == 'Bag'
                              ? 0
                              : 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        i,
                        style: i == 'All' ? subTitle4 : subTitle3,
                      ),
                      const SizedBox(height: 4.0),
                      i == 'All'
                          ? Transform.rotate(
                              angle: math.pi / 4,
                              child: Container(
                                height: 4,
                                width: 4,
                                color: primary,
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: GridView.builder(
              controller: scrollController,
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 260.16,
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 165,
                    child: Image.asset(
                      'lib/assets/images/R${index + 1}.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '21WN reversible angora cardigan',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: bodySmall,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '\$120',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: bodySmall2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Explore More',
                  style: bodyLarge,
                ),
                const SizedBox(width: 8.0),
                SvgPicture.asset(
                  'lib/assets/icons/Forward Arrow.svg',
                  height: 18.0,
                  width: 18.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = label
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.46, size.height * 0.5);
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.46, size.height * 0.5);
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.54, size.height * 0.5);
    path.moveTo(size.width * 0.54, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.5);
    path.moveTo(size.width * 0.54, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height);
    path.moveTo(size.width * 0.5, size.height);
    path.lineTo(size.width * 0.46, size.height * 0.5);
    // path.lineTo(size.width, size.height * 0.5);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({
    super.key,
    required AnimationController controller,
    required Animation animation,
    required Animation animation2,
  })  : _controller = controller,
        _animation = animation,
        _animation2 = animation2;

  final AnimationController _controller;
  final Animation _animation;
  final Animation _animation2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 660.0,
      child: Stack(
        children: [
          Image.asset('lib/assets/images/image 10.png'),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Positioned(
              top: _animation.value,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 60.0,
                  bottom: 20,
                ),
                child: Text(
                  'LUXURY\n  FASHION\n&ACCESSORIES',
                  style: getStyle(
                    1.0,
                    1.21,
                    38.66,
                    _animation2.value,
                    family: 'BodoniModa',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40.0,
                width: 253.0,
                decoration: BoxDecoration(
                  color: titleActive.withOpacity(.4),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    'EXPLORE COLLECTION',
                    style: getStyle(
                      1.0,
                      0.0,
                      16.0,
                      offWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.18, right: 12.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < 3; i++)
                    Transform.rotate(
                      angle: -40.0,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        width: 5.66,
                        height: 5.66,
                        decoration: BoxDecoration(
                          color: i == 0 ? offWhite : Colors.transparent,
                          border: Border.all(
                            color: offWhite,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.42,
      margin: const EdgeInsets.only(top: 19.0),
      padding: const EdgeInsets.only(left: 16.0, right: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset('lib/assets/icons/Menu.svg')),
          ),
          Expanded(
            child: SvgPicture.asset('lib/assets/icons/Logo.svg'),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset('lib/assets/icons/Search.svg'),
                  const SizedBox(width: 16.0),
                  SvgPicture.asset('lib/assets/icons/shopping bag.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
