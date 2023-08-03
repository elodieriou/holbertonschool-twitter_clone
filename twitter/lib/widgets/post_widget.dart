import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String title;
  final String content;
  final String userAvatarUrl;
  final String userName;
  final bool isVerified;
  final String username;
  final String hoursAgo;
  final int commentsCount;
  final int transferCount;
  final int loveCount;

  const PostWidget({super.key,
    required this.title,
    required this.content,
    required this.userAvatarUrl,
    required this.userName,
    required this.isVerified,
    required this.username,
    required this.hoursAgo,
    required this.commentsCount,
    required this.transferCount,
    required this.loveCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userAvatarUrl),
            ),
            title: Row(
              children: [
                Text(userName),
                if (isVerified) const SizedBox(width: 4),
                if (isVerified)
                  const Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 15,
                  ),
              ],
            ),
            subtitle: Text('$username • $hoursAgo'),
            trailing: IconButton(
              icon: const Icon(Icons.more_horiz),
              color: Colors.black,
              onPressed: () {
                if (kDebugMode) {
                  print('More Button Clicked');
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.comment),
                    color: commentsCount > 0 ? Colors.blue : Colors.grey,
                    onPressed: () {
                      if (kDebugMode) {
                        print('CommentButton Clicked');
                      }
                    },
                  ),
                  Text(commentsCount.toString()),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.swap_horiz),
                    color: transferCount > 0 ? Colors.blue : Colors.grey,
                    onPressed: () {
                      if (kDebugMode) {
                        print('Swap Button Clicked');
                      }
                    },
                  ),
                  Text(transferCount.toString()),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    color: loveCount > 0 ? Colors.red : Colors.grey,
                    onPressed: () {
                      if (kDebugMode) {
                        print('Favorite Button Clicked');
                      }
                    },
                  ),
                  Text(loveCount.toString()),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.share),
                color: Colors.blue,
                onPressed: () {
                  if (kDebugMode) {
                    print('Share Button Clicked');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
