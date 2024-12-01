import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store - 221124',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Clothing Store '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> clothes = [
    {
      'name': 'Basic poplin shirt',
      'image': 'assets/BASIC_POPLIN_SHIRT.png',
      'description': 'V-neck lapel collar shirt with long sleeves. Front button closure.',
      'price': '35',
    },
    {
      'name': 'Denim Vest',
      'image': 'assets/DENIM_VEST.png',
      'description': 'Sleeveless design with V-neckline. Contrast seams. Front metal button closure',
      'price': '45',
    },
    {
      'name': 'Combination T-shirt with zipper vest',
      'image': 'assets/COMBINATION_T-SHIRT_WITH_ZIPPER_VEST.png',
      'description': 'Long sleeve round neck T-shirt. Contrast vest overlay detail with zip-up high neck and side ties.',
      'price': '40',
    },
    {
      'name': 'Double waist wide leg pants',
      'image': 'assets/DOUBLE_WAIST_WIDE_LEG_PANTS.png',
      'description': 'Pants with an adjustable double high elastic waistband with drawstring and matching fabric.',
      'price': '70',
    },
    {
      'name': 'High rise wide leg jeans',
      'image': 'assets/Z1975_HIGH_RISE_WIDE_LEG_JEANS.png',
      'description': 'High rise five pocket jeans. Washed effect. Wide leg. Front zip and button closure.',
      'price': '48',
    },
    {
      'name': 'Belted wool blend coat',
      'image': 'assets/BELTED_WOOL_BLEND_COAT.png',
      'description': 'Coat made of wool blend fabric. Lapel collar and long sleeves with buttoned straps.',
      'price': '150',
    },

    {
      'name': 'Soft pocket jacket',
      'image': 'assets/SOFT_POCKET_JACKET.png',
      'description': 'Lapel collar jacket with long cuffed sleeves. Front patch pockets. Front button closure.',
      'price': '82',
    },

    {
      'name': 'Gold button knitted vest top ',
      'image': 'assets/GOLD_BUTTON_KNITTED_VEST_TOP.png',
      'description': 'Plain knit sleeveless vest top with round neck. Front slit at hem. Front closure with gold buttons.',
      'price': '37',
    },


  ];

  List<Map<String, String>> filteredClothes = [];

  @override
  void initState() {
    super.initState();
    filteredClothes = clothes;
  }

  void _filterClothes(String query) {
    setState(() {
      filteredClothes = clothes
          .where((item) =>
          item['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => _filterClothes(value),
              decoration: InputDecoration(
                hintText: 'Search for a product...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          // Product Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredClothes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(product: filteredClothes[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Image.asset(
                              filteredClothes[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          filteredClothes[index]['name']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '\$${filteredClothes[index]['price']}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final Map<String, String> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product['image']!,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              product['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(product['description']!),
            const SizedBox(height: 16.0),
            Text(
              'Price: \$${product['price']}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
