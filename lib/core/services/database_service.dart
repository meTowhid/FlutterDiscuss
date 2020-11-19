import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_discuss/core/models/answer.dart';
import 'package:flutter_discuss/core/models/question.dart';
import 'package:flutter_discuss/core/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection references
  final DocumentReference fireData = FirebaseFirestore.instance.doc('FlutterDiscuss/data');
  final CollectionReference questionsCollection = FirebaseFirestore.instance.collection('FlutterDiscuss/data/questions');
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('FlutterDiscuss/data/users');

  Future<void> updateUserData({String name, String email}) async {
    return await usersCollection.doc(uid).set({
      'name': name,
      'email': email,
    });
  }

  Future<void> postNewQuestion({String title, String description, String tags, List<String> images}) async {
    return await questionsCollection.doc().set({
      'title': title,
      'description': description,
      'tags': tags,
      'images': images,
    });
  }

  Future<void> postAnswer({String answerLine, String questionId}) async {
    var doc = questionsCollection.doc(questionId).collection('answers').doc();
    print('-> ${doc.path}');
    return await questionsCollection.doc(questionId).collection('answers').doc().set({
      'answer_line': answerLine,
      'user_uid': uid,
    });
  }

  // question list from snapshot
  List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Question(
        id: doc.id,
        title: doc.data()['title'] ?? '',
        description: doc.data()['description'] ?? '',
        tags: doc.data()['tags'] ?? [],
        images: doc.data()['images'] ?? [],
      );
    }).toList();
  }

  // question list from snapshot
  List<Answer> _answerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Answer(
        answerLine: doc.data()['answer_line'] ?? '',
        userUid: doc.data()['user_uid'] ?? '',
        voteCount: doc.data()['vote_count'] ?? 0,
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(uid: uid, name: snapshot.data()['name']);
  }

  // get questions stream
  Stream<List<Question>> get questions {
    return questionsCollection.snapshots().map(_questionListFromSnapshot);
  }

  Stream<List<Answer>> answers(String questionId) {
    return questionsCollection.doc(questionId).collection('answers').snapshots().map(_answerListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return usersCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
