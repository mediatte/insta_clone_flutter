
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [
        StoryArea(),
        FeedList(),
      ]),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10, (index) => UserStory(userName: 'User $index'),),

      ),

    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({required this.userName, super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData(userName: 'User1', likeCount: 50, content: 'Dart에서는 클래스에서 생성자를 사용할 때, this 키워드를 사용하여 클래스의 인스턴스 변수에 접근할 수 있습니다. 생성자의 매개변수와 클래스의 멤버 변수 이름이 같은 경우에는, 매개변수 이름 앞에 this.을 붙여서 구분할 수 있습니다.'),
  FeedData(userName: 'User2', likeCount: 24, content: '오늘 저녁은 맛있었다'),
  FeedData(userName: 'User3', likeCount: 44, content: '오늘 참치는 맛있었다'),
  FeedData(userName: 'User4', likeCount: 33, content: '오늘 점심은 굶어야지'),
  FeedData(userName: 'User5', likeCount: 22, content: '오늘 뭐하지'),
  FeedData(userName: 'User6', likeCount: 5110, content: '오늘 열심히 일했다'),
  FeedData(userName: 'User7', likeCount: 550, content: '오늘 어제 다 야근했다'),
  FeedData(userName: 'User8', likeCount: 3350, content: '난 뭐하지'),
  FeedData(userName: 'User9', likeCount: 55, content: '넌 누구야'),

];

class FeedList extends StatelessWidget {
  const FeedList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: feedDataList.length,
        itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),);
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade300,
                  ),
                ),
                const SizedBox(width: 8),
                Text(feedData.userName),
              ],
            ),
            const Icon(Icons.more_vert),
          ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
                IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.chat_bubble)),
                IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.paperplane)),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bookmark,))
              ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,),
          child: Text('좋아요 ${feedData.likeCount}개', style: const TextStyle(fontWeight: FontWeight.bold,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4,),
          child: RichText(text: TextSpan(
            children: [
              TextSpan(text: feedData.userName, style: const TextStyle(fontWeight: FontWeight.bold,)),
              TextSpan(text: feedData.content),
            ],
            style: const TextStyle(color: Colors.black,),
          )),
        ),
        const SizedBox(height: 8,)
      ],
    );

  }
}
