import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/mentor.dart';

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  const MentorCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/images/dog.jpg'),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRatingAndSector(),
                  Text(mentor.name, style: TextStyles.mentorName),
                  _buildDetailsRow(),
                  const SizedBox(height: 4),
                  Text(
                    mentor.description,
                    style: TextStyles.description.copyWith(
                      fontSize: 10,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${mentor.compatibility}% compatibility',
                    style: TextStyle(
                      color: mentor.compatibility < 85
                          ? Colors.grey
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingAndSector() {
    return Row(
      children: [
        const Icon(Icons.star_border, color: Colors.lightGreen, size: 16),
        const SizedBox(width: 4),
        Text(
          mentor.rating.toString(),
          style: TextStyles.rating.copyWith(
            fontSize: 13,
            color: Colors.lightGreen,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.amber.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            mentor.sector,
            style: TextStyles.sectorTag.copyWith(color: Colors.amber.shade300),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsRow() {
    const darkBlue = AppColors.primaryBlue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.alarm, size: 16, color: darkBlue),
                const SizedBox(width: 4),
                Text(
                  mentor.experience,
                  style: const TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.work_outline, size: 16, color: darkBlue),
                const SizedBox(width: 4),
                Text(
                  mentor.field,
                  style: const TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.comment_outlined, size: 16, color: darkBlue),
            const SizedBox(width: 4),
            Text(
              '${mentor.reviews} Reviews',
              style: const TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
