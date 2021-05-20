import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ui/widgets/myCartTopBar.dart';

class CartObj {
  final String title;
  final String creator;
  final double price;

  CartObj({this.title, this.creator, this.price});
}

class MyCart extends StatelessWidget {
  MyCart({Key key}) : super(key: key);

  final List<CartObj> _courses = [
    CartObj(
        title: "React - The Complete Guide (incl Hooks, React Router, Redux)",
        creator:
            "Academind by Maximillian Schwarzmuller, Maximillian Schwarzmuller",
        price: 899),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(
                child: Container(
              margin: EdgeInsets.only(top: 65),
              child: ListView.builder(
                itemCount: _courses.length,
                itemBuilder: (ctx, index) => Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blueAccent),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  width: double.infinity,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text(_courses[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3),
                                        ),
                                        Text(_courses[index].creator,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            '₹${_courses[index].price}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                            Center(
                              child: IconButton(
                                  icon: Icon(Icons.delete_outline_outlined,
                                      color: Colors.redAccent),
                                  onPressed: () => {}),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Positioned(
              top: 0,
              child: MyCartTopBar(),
            )
          ],
        ),
      ),
    );
  }
}
