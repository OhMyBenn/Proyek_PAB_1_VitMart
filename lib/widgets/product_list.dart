import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final String searchQuery;

  const ProductList({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "image": "images/Chitato.jpg",
        "name": "Chitato",
        "price": "RP 10.000",
      },
      {
        "image": "images/Bigbabol.jpg",
        "name": "Big Babol",
        "price": "RP 2.500",
      },
      {
        "image": "images/Kacang.jpg",
        "name": "Kacang Garuda",
        "price": "RP 7.000",
      },
      {
        "image": "images/Khongguan.jpg",
        "name": "Khong Guan",
        "price": "RP 55.000",
      },
      {
        "image": "images/Cocacola.jpg",
        "name": "Cocacola",
        "price": "RP 6.000",
      },
      {
        "image": "images/Fanta.jpg",
        "name": "Fanta",
        "price": "RP 11.000",
      },
      {
        "image": "images/Golda.png",
        "name": "Golda",
        "price": "RP 5.000",
      },
      {
        "image": "images/Minerale.webp",
        "name": "Le Minerale",
        "price": "RP 8.000",
      },
      {
        "image": "images/Mylanta.jpg",
        "name": "Mylanta",
        "price": "RP 5.000",
      },
      {
        "image": "images/Obhcombi.webp",
        "name": "OBH Combi",
        "price": "RP 18.000",
      },
      {
        "image": "images/Tolakangin.jpg",
        "name": "Tolak Angin",
        "price": "RP 2.500",
      },
      {
        "image": "images/Oskadon.jpg",
        "name": "Oskadon",
        "price": "RP 12.500",
      },
      {
        "image": "images/Hotwheels.webp",
        "name": "Hot Wheels",
        "price": "RP 30.000",
      },
      {
        "image": "images/Uno.webp",
        "name": "Uno",
        "price": "RP 15.000",
      },
      {
        "image": "images/Pokemon.webp",
        "name": "Kartu Pokemon",
        "price": "RP 25.000",
      },
      {
        "image": "images/Boboiboy.jpg",
        "name": "Kartu Boboiboy",
        "price": "RP 20.000",
      },
    ];

    // FILTER PRODUK
    final filteredProducts = products.where((product) {
      return product["name"]!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    if (filteredProducts.isEmpty) {
      return const SizedBox(
        height: 120,
        child: Center(
          child: Text(
            "Produk tidak ditemukan",
            style: TextStyle(color: Colors.white70),
          ),
        ),
      );
    }

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredProducts.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final product = filteredProducts[index];

          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(14)),
                  child: Image.asset(
                    product["image"]!,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    product["name"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    product["price"]!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
