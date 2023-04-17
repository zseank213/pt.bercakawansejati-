import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pt_berca_kawan_sejati/lib.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductCubit _productCubit = ProductCubit();

  int itemOnCart = 0;

  List<DatumProduct> data = [];

  List<TextEditingController> _controller = [];

  getNumberOnCart() async {
    final itemOnCartStorage = await SharedPrefsStorage.getItemOnCart();

    setState(() {
      itemOnCart = itemOnCartStorage ?? 0;
    });
  }

  @override
  void initState() {
    getNumberOnCart();
    _productCubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _productCubit),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarTextTitleNoElevation(
          context,
          text: 'CigarMobile',
          isCenter: true,
          action: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                ),
                if (itemOnCart != 0) ...[
                  Positioned(
                    right: 10,
                    top: 5,
                    child: Container(
                      height: 15,
                      width: 15,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                          "${itemOnCart}",
                          style: textButton(color: neutral30),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (cProduct, sProduct) {
            if (sProduct is OnLoadingGetDataProduct) {
              print("Loading");
            }
            if (sProduct is OnErrorGetDataProduct) {}
            if (sProduct is OnSuccessGetDataProduct) {
              sProduct.data?.data?.forEach((dataListener) {
                if (dataListener.isActive == true) {
                  setState(() {
                    data.add(dataListener);
                  });
                }
              });

              _controller = List.generate(
                data.length,
                (index) => TextEditingController(text: "0"),
              );
            }
          },
          builder: (cProduct, sProduct) {
            if (sProduct is OnSuccessGetDataProduct) {
              return InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: (1 / 1.5),
                  children: List.generate(
                    data.length,
                    (index) {
                      return ProductCard(
                        context: context,
                        data: data[index],
                        index: index,
                        controller: _controller[index],
                        onTapMinus: () {
                          print("CLICK MINUS");
                          setState(() {
                            if (_controller[index].text != "0") {
                              if (int.parse(_controller[index].text) > 1) {
                                print("kondisi 1");
                                _controller[index] = TextEditingController(text: "${int.parse(_controller[index].text) - 1}");
                              }
                            }
                          });
                        },
                        onTapPlus: () {
                          print("CLICK Plus");
                          setState(() {
                            // itemCount = itemCount + 1;
                            if (_controller[index].text != "0") {
                              _controller[index] = TextEditingController(text: "${int.parse(_controller[index].text) + 1}");
                            } else {
                              _controller[index] = TextEditingController(text: "1");
                            }

                            // controller = TextEditingController(text: "${int.parse(controller.text) + 1}");
                          });
                        },
                      );
                    },
                  ),
                ),
              );
            }

            if (sProduct is OnLoadingGetDataProduct) {
              return GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(
                  10,
                  (index) => ShimmerEffect(),
                ),
              );
            }
            return Container();
          },
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: BigButton(
            text: "Add To Cart",
            onTap: () {},
            color: pinkButton,
            textStyle: textNormal(
              color: neutral30,
              isBold: true,
            ),
            shadow: true,
          ),
        ),
      ),
    );
  }
}
