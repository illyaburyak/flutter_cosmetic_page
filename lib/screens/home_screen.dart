import 'package:flutter/material.dart';

const PRIMARY = 'primary';
const WHITE = 'white';
const SECONDARY = 'secondary';
const GREY = 'gray';

const Map<String, Color> myColors = {
  PRIMARY: Color.fromRGBO(50, 60, 80, 1),
  WHITE: Colors.white,
  SECONDARY: Color.fromRGBO(240, 245, 250, 1),
  GREY: Colors.grey,
};

var priceTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      backgroundColor: myColors[PRIMARY],
      body: _Body(),
    );
  }
}

// Stack like a column and row, it takes a maximum amount of space, so we need to give it some kind of constraints.
// We can wrap it in container or wrap it in a Expanded
// Position gives us set the position in the stack  according to the top bottom left or right or its parent.
// in stack, first element you build is gonna be underneath, and next gonna be on top. Whatever hghier up in a stuck is underneath.

// When i have one widget wraped in Expended without fix, and onther not wrapped but have a fixed size, second will be processed first, and whatever amount space is left will be devided among the expanded widgets

Widget _myAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      backgroundColor: myColors[WHITE],
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
        ),
        child: IconButton(
          icon: Icon(
            Icons.menu,
            color: myColors[PRIMARY],
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: myColors[PRIMARY],
              size: 30,
            ),
          ),
        ),
      ],
    ),
  );
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: myColors[WHITE],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    'Cosmetics that Everyone loves!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (_, constrains) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _ImageTile(
                            width: constrains.maxWidth * .4,
                            height: constrains.maxHeight * .85,
                            imagePath: 'img/makeup1.png',
                            addCallback: () => print('Item added'),
                            favoriteCallback: () => print('Item favorited'),
                            price: 15.00,
                          ),
                          Column(
                            children: [
                              _ImageTile(
                                width: constrains.maxWidth * .3,
                                height: constrains.maxHeight * .37,
                                imagePath: 'img/makeup2.png',
                                addCallback: () => print('Item added'),
                                favoriteCallback: () => print('Item favorited'),
                                price: 75.00,
                              ),
                              SizedBox(height: 8),
                              _ImageTile(
                                width: constrains.maxWidth * .3,
                                height: constrains.maxHeight * .37,
                                imagePath: 'img/makeup3.png',
                                addCallback: () => print('Item added'),
                                favoriteCallback: () => print('Item favorited'),
                                price: 55.00,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 40, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recomended!',
                      style: TextStyle(
                        color: myColors[WHITE],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.arrow_forward,
                            color: myColors[PRIMARY],
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    children: [
                      Positioned(
                        right: 20,
                        child: Container(
                          height: constraints.maxHeight * 0.8,
                          width: constraints.maxWidth * 0.8,
                          decoration: BoxDecoration(
                            color: myColors[WHITE],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        child: Container(
                          height: constraints.maxHeight * .8,
                          width: constraints.maxWidth * .85,
                          child: Row(
                            children: [
                              Image(
                                height: constraints.maxHeight * .8,
                                image: AssetImage('img/makeup4.png'),
                              ),
                              SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: constraints.maxWidth * .4,
                                    child: Text(
                                      'Multi shades many options available',
                                      style: TextStyle(
                                        color: myColors[GREY],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    child: Text(
                                      '\$75.00',
                                      style: priceTextStyle,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 10),
                                  FavoriteBtn(
                                    favoriteCallback: () =>
                                        print('Recommended item favorited'),
                                  ),
                                  SizedBox(height: 18),
                                  PlusBtn(
                                    addCallback: () =>
                                        print('Recommended item added'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ImageTile extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final Function favoriteCallback;
  final Function addCallback;
  final double price;

  const _ImageTile(
      {Key key,
      @required this.height,
      @required this.imagePath,
      @required this.favoriteCallback,
      @required this.addCallback,
      @required this.price,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              width: width,
              child: Image(
                image: AssetImage(imagePath),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: FavoriteBtn(favoriteCallback: favoriteCallback),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: priceTextStyle,
            ),
            SizedBox(width: 10),
            PlusBtn(addCallback: addCallback),
          ],
        ),
      ],
    );
  }
}

class PlusBtn extends StatelessWidget {
  const PlusBtn({
    Key key,
    @required this.addCallback,
  }) : super(key: key);

  final Function addCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addCallback,
      child: Container(
        decoration: BoxDecoration(
          color: myColors[SECONDARY],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.add,
              color: myColors[PRIMARY],
              size: 18,
            )),
      ),
    );
  }
}

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({
    Key key,
    @required this.favoriteCallback,
  }) : super(key: key);

  final Function favoriteCallback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => favoriteCallback,
      icon: Icon(
        Icons.favorite_border,
        color: myColors[PRIMARY],
        size: 25,
      ),
    );
  }
}
