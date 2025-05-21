import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/mentor.dart';
import '../widgets/mentor_card.dart';

class MentorScreen extends StatefulWidget {
  const MentorScreen({super.key});

  @override
  State<MentorScreen> createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  int _selectedTabIndex = 0;
  final _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  List<Mentor> _filteredMentors = [];

  static final List<Mentor> myMentors = [
    Mentor(
      name: 'Rishi Vejani',
      rating: 9.9,
      sector: 'IT Sector',
      experience: '4 years',
      field: 'Business Administration',
      reviews: 175,
      description:
          'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon, ESCP Europe | 32+ National Case Comps Podiums',
      compatibility: 98,
    ),
    Mentor(
      name: 'Gaurav Samant',
      rating: 4.9,
      sector: 'IT Sector',
      experience: '4 years',
      field: 'Business Administration',
      reviews: 175,
      description:
          'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon, ESCP Europe | 32+ National Case Comps Podiums',
      compatibility: 82,
    ),
  ];

  static final List<Mentor> exploreMentors = [
    Mentor(
      name: 'Gaurav Samant',
      rating: 4.9,
      sector: 'IT Sector',
      experience: '4 years',
      field: 'Business Administration',
      reviews: 175,
      description:
          'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon, ESCP Europe | 32+ National Case Comps Podiums',
      compatibility: 98,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredMentors = _selectedTabIndex == 0 ? myMentors : exploreMentors;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    final allMentors = _selectedTabIndex == 0 ? myMentors : exploreMentors;

    setState(() {
      _filteredMentors = allMentors
          .where((mentor) => mentor.name.toLowerCase().contains(query))
          .toList();
    });
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
      _searchController.clear();
      _filteredMentors = index == 0 ? myMentors : exploreMentors;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: const Text('CATALIFT', style: TextStyles.appBarTitle),
        actions: [
          IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              'Mentors',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
          _buildTabs(),
          _buildSearchBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _filteredMentors.length,
              itemBuilder: (context, index) {
                return MentorCard(mentor: _filteredMentors[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.tabInactiveBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            _buildTabItem("MY MENTORS", 1),
            _buildTabItem("EXPLORE", 0),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    final isSelected = _selectedTabIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabChanged(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              label,
              style:
                  (isSelected ? TextStyles.tabActive : TextStyles.tabInactive)
                      .copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: AppColors.primaryBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.explore), label: 'Explore Mentors'),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined), label: 'Courses'),
      ],
    );
  }
}
