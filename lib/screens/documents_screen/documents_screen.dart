import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/document_card_view.dart';
import 'package:lettutor/styles/consts.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  _DocumentsScreenState createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                PaddingValue.extraLarge,
                0,
                PaddingValue.extraLarge,
                PaddingValue.extraLarge,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 4,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: CupertinoSearchTextField(),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(
                  PaddingValue.extraLarge,
                ),
                itemBuilder: (_, __) => DocumentCardView(
                  onTap: () {},
                  imageUrl:
                      'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg',
                  title: 'NEW HEADWAY ELEMENTARY',
                  level: 'Beginner',
                  description:
                      'For kids who want to learn English through pictures, pick up simple vocabulary and simple structures.',
                ),
                separatorBuilder: (_, __) => SizedBox(
                  height: SpacingValue.large,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
