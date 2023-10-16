import 'package:flutter/material.dart';
import 'package:warung_app/core.dart';
import '../controller/mainmenu_controller.dart';

class MainmenuView extends StatefulWidget {
  const MainmenuView({Key? key}) : super(key: key);

  Widget build(context, MainmenuController controller) {
    controller.view = this;

    return Scaffold(
        body: SafeArea(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 100,
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        color: Colors.red,
                      ),
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/128/45/45332.png",
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Good Morning",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "Fajar Husain Asy'ari",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        children: List.generate(controller.categories.length,
                            (index) {
                          var item = controller.categories[index];
                          bool selected =
                              controller.selectedCategoryIndex == index;

                          return InkWell(
                            onTap: () => controller.updateCategoryIndex(index),
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 12.0,
                              ),
                              child: Text(
                                "$item",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: selected ? Colors.red : Colors.grey),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        children:
                            List.generate(controller.products.length, (index) {
                          var item = controller.products[index];
                          return Container(
                            margin: const EdgeInsets.only(
                              right: 12.0,
                            ),
                            width: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        item["photo"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  item["product_name"],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "\$${item["price"]}",
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Taste of Indonesia",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 160.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaK7nnNNcBOBRHnApa7V2PyvE2N3TakRhtoXagARKm5jxou4xZ59el_Gi0J9Hkk9XBxZI&usqp=CAU",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.0 / 1.4,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: controller.products.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = controller.products[index];
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        item["photo"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        6.0,
                                      ),
                                    ),
                                  ),
                                  child: const Stack(
                                    children: [
                                      Positioned(
                                        right: 6.0,
                                        top: 8.0,
                                        child: CircleAvatar(
                                          radius: 14.0,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 14.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                item["product_name"],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                item["category"],
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "${item["price"]}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  State<MainmenuView> createState() => MainmenuController();
}
