import 'package:flutter/material.dart';
import 'package:rootandbrush/screens/market.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom Logo Image
            Image.asset(
              'images/logo.png', // Replace with the path to your custom logo
              height: 50,
              width: 100, // Adjust the height to fit the AppBar
            ),
            
            const Text(
              'ROOT N BRUSH',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Row of Avatars and "+" button
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/woman1.jpeg'),
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/woman4.jpeg'),
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/woman2.jpeg'),
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/man1.jpeg'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recent',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Horizontally scrollable images
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'images/art$i.jpeg',
                              width: 150,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Trending Collections',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Grid layout for the collections
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  List<Map<String, String>> collections = [
                    {
                      'image': 'images/craft1.jpeg',
                      'title': '3D Art',
                      'count': '200',
                    },
                    {
                      'image': 'images/childlaugh.jpeg',
                      'title': 'Graphic Design',
                      'count': '150',
                    },
                    {
                      'image': 'images/craft2.jpeg',
                      'title': 'Photography',
                      'count': '300',
                    },
                    {
                      'image': 'images/craft3.jpeg',
                      'title': 'Portrait Art',
                      'count': '220',
                    },
                    {
                      'image': 'images/craft4.jpeg',
                      'title': 'Digital Art',
                      'count': '180',
                    },
                    {
                      'image': 'images/craft5.jpeg',
                      'title': 'Abstract Art',
                      'count': '250',
                    },
                  ];

                  return CollectionTile(
                    image: collections[index]['image']!,
                    title: collections[index]['title']!,
                    count: collections[index]['count']!,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // Custom Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.deepPurple[800],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () => _onItemTapped(1),
              ),
              const SizedBox(width: 40), // Space for FloatingActionButton
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MarketPlace()), // Navigate to Signup
                            );  

        },
        child: const Icon(Icons.apps, color: Colors.deepPurple),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class CollectionTile extends StatelessWidget {
  final String image;
  final String title;
  final String count;

  const CollectionTile({
    required this.image,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
