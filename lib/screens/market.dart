import 'package:flutter/material.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;


  // Define separate lists for each category with avatar images
  final List<Map<String, String>> abstractArt = [
    {'title': 'Cliff', 'artist': 'Eddie Bunton Cole', 'image': 'images/cliff.jpeg', 'avatar': 'images/artist1.jpeg'},
    {'title': 'Calm Waves', 'artist': 'Alice Sesay', 'image': 'images/calm_waves.jpeg', 'avatar': 'images/artist2.jpeg'},
    {'title': 'Cliff', 'artist': 'Eddie Bunton Cole', 'image': 'images/cliff.jpeg', 'avatar': 'images/artist1.jpeg'},
    {'title': 'Calm Waves', 'artist': 'Alice Sesay', 'image': 'images/calm_waves.jpeg', 'avatar': 'images/artist2.jpeg'},
    {'title': 'Cliff', 'artist': 'Eddie Bunton Cole', 'image': 'images/cliff.jpeg', 'avatar': 'images/artist1.jpeg'},
    {'title': 'Calm Waves', 'artist': 'Alice Sesay', 'image': 'images/calm_waves.jpeg', 'avatar': 'images/artist2.jpeg'},
    // Add more abstract art items...
  ];

  final List<Map<String, String>> photographyArt = [
    {'title': 'Nature Beauty', 'artist': 'John Doe', 'image': 'images/nature_beauty.jpeg', 'avatar': 'images/artist3.jpeg'},
    {'title': 'Urban Life', 'artist': 'Jane Smith', 'image': 'images/urban_life.jpeg', 'avatar': 'images/artist4.jpeg'},
    {'title': 'Nature Beauty', 'artist': 'John Doe', 'image': 'images/nature_beauty.jpeg', 'avatar': 'images/artist3.jpeg'},
    {'title': 'Urban Life', 'artist': 'Jane Smith', 'image': 'images/urban_life.jpeg', 'avatar': 'images/artist4.jpeg'},
    {'title': 'Nature Beauty', 'artist': 'John Doe', 'image': 'images/nature_beauty.jpeg', 'avatar': 'images/artist3.jpeg'},
    {'title': 'Urban Life', 'artist': 'Jane Smith', 'image': 'images/urban_life.jpeg', 'avatar': 'images/artist4.jpeg'},
    // Add more photography items...
  ];

  final List<Map<String, String>> paintingArt = [
    {'title': 'Old Town', 'artist': 'Elena Grace', 'image': 'images/art1.jpeg', 'avatar': 'images/woman1.jpeg'},
    {'title': 'Sunset Glory', 'artist': 'Lucas Roy', 'image': 'images/art0.jpeg', 'avatar': 'images/man2.jpeg'},
    {'title': 'Old Town', 'artist': 'Elena Grace', 'image': 'images/art2.jpeg', 'avatar': 'images/woman4.jpeg'},
    {'title': 'Sunset Glory', 'artist': 'Lucas Roy', 'image': 'images/art3.jpeg', 'avatar': 'images/woman2.jpeg'},
    {'title': 'Old Town', 'artist': 'Elena Grace', 'image': 'images/art4..jpeg', 'avatar': 'images/man1.jpeg'},
    {'title': 'Sunset Glory', 'artist': 'Lucas Roy', 'image': 'images/art5.jpeg', 'avatar': 'images/man3.jpeg'},
    // Add more painting items...
  ];

  final List<Map<String, String>> digitalArt = [
    {'title': 'Cyber Dreams', 'artist': 'Ava Tech', 'image': 'images/cyber_dreams.jpeg', 'avatar': 'images/artist7.jpeg'},
    {'title': 'Virtual Reality', 'artist': 'Liam Quantum', 'image': 'images/virtual_reality.jpeg', 'avatar': 'images/artist8.jpeg'},
    {'title': 'Cyber Dreams', 'artist': 'Ava Tech', 'image': 'images/cyber_dreams.jpeg', 'avatar': 'images/artist7.jpeg'},
    {'title': 'Virtual Reality', 'artist': 'Liam Quantum', 'image': 'images/virtual_reality.jpeg', 'avatar': 'images/artist8.jpeg'},
    {'title': 'Cyber Dreams', 'artist': 'Ava Tech', 'image': 'images/cyber_dreams.jpeg', 'avatar': 'images/artist7.jpeg'},
    {'title': 'Virtual Reality', 'artist': 'Liam Quantum', 'image': 'images/virtual_reality.jpeg', 'avatar': 'images/artist8.jpeg'},
    // Add more digital art items...
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        title: const Text(
          'Market Place',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.purpleAccent,
          labelColor: Colors.purpleAccent,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Abstract'),
            Tab(text: 'Photography'),
            Tab(text: 'Painting'),
            Tab(text: 'Digital Art'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildGridView(abstractArt),
          buildGridView(photographyArt),
          buildGridView(paintingArt),
          buildGridView(digitalArt),
        ],
      ),

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

  // A helper method to build a GridView for each tab
  Widget buildGridView(List<Map<String, String>> items) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ArtCard(
          title: item['title']!,
          artist: item['artist']!,
          image: item['image']!,
          avatar: item['avatar']!, // Pass the avatar path
        );
      },
    );
  }
}

class ArtCard extends StatelessWidget {
  final String title;
  final String artist;
  final String image;
  final String avatar;

  const ArtCard({
    Key? key,
    required this.title,
    required this.artist,
    required this.image,
    required this.avatar, // Accept the avatar path
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(avatar), // Use the specific avatar image
                ),
                const SizedBox(width: 4),
                Text(
                  artist,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
