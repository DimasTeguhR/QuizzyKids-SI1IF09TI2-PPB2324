import 'package:flutter/material.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';

class QuizScreenAnimal extends StatefulWidget {
  @override
  _QuizScreenAnimalState createState() => _QuizScreenAnimalState();
}

class _QuizScreenAnimalState extends State<QuizScreenAnimal> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'Binatang apa yang memiliki leher panjang dan biasanya tinggal di danau atau sungai?',
      'answers': ["Kucing",
      "Kuda",
      "Angsa"],
      'correctAnswer': 'Angsa',
    },
    {
      'question': 'Binatang apa yang memiliki taring tajam dan biasanya tinggal di hutan?',
      'answers': ["Gajah",
        "Singa",
        "Jerapah"],
      'correctAnswer': 'Singa',
    },
    {
      'question': 'Contoh hewan yang hidupnya di air dan darat adalah',
      'answers': ["Udang",
        "Ikan Mas",
        "Katak"],
      'correctAnswer': 'Katak',
    },
    {
      'question': 'Hewan mamalia yang hidup di air, memiliki sirip',
      'answers': ["Ikan",
        "Kura Kura",
        "Zebra"],
      'correctAnswer': 'Ikan',
    },
    {
      'question': 'Hewan pemakan rumput, berkaki empat, dan menghasilkan susu',
      'answers': ["Badak",
        "Sapi",
        "Kuda"],
      'correctAnswer': 'Sapi',
    },
  ];

  void _answerQuestion(String answer) {
    if (answer == _questions[_currentQuestionIndex]['correctAnswer']) {
      _score++;
    }
    setState(() {
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= _questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: _score)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.sizeOf(context).height;
    var widthDevice = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_quiz.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: widthDevice * 0.05, vertical: widthDevice * 0.05),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromARGB(0, 7, 85, 255),
            appBar: AppBar(
              toolbarHeight: heightDevice * 0.08,
              centerTitle: true,
              backgroundColor: const Color.fromARGB(0, 255, 193, 7),
              leading: Container(
                width: widthDevice * 0.15,
                height: widthDevice * 0.15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kDeepPurple,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: kWhite,
                ),
              ),
              title: Text('Quizzy Kids', style: kHeading2),
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    width: widthDevice * 0.9,
                    height: heightDevice * 0.08,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: kYellow,
                    ),
                    child: Center(
                      child: Text(
                        'Binatang',
                        style: kHeading7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Salah : ',
                        style: kSubtitle2,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          'Benar : ',
                          style: kSubtitle2,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: widthDevice * 0.6,
                        height: widthDevice * 0.5,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/model_img_quiz.png')),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: Text(
                          _questions[_currentQuestionIndex]['question'] as String,
                          style: kSubtitle2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),  // Adjusted the spacing here
                  Column(
                    children: (_questions[_currentQuestionIndex]['answers'] as List<String>).map((answer) {
                      return Container(
                        width: widthDevice * 0.8,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ElevatedButton(
                          onPressed: () => _answerQuestion(answer),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kRed,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadowColor: kBlack,
                            elevation: 3,
                          ),
                          child: Text(
                            answer,
                            style: kSubtitle1,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: heightDevice * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_currentQuestionIndex > 0) {
                            setState(() {
                              _currentQuestionIndex--;
                            });
                          }
                        },
                        child: Container(
                          width: widthDevice * 0.3,
                          height: widthDevice * 0.1,
                          decoration: const BoxDecoration(
                            color: kRed,
                            boxShadow: [
                              BoxShadow(
                                color: kBlack,
                                offset: Offset(-2, 3),
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Kembali',
                              style: kSubtitle1,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_currentQuestionIndex < _questions.length - 1) {
                            _answerQuestion(_questions[_currentQuestionIndex]['correctAnswer'] as String);
                          }
                        },
                        child: Container(
                          width: widthDevice * 0.3,
                          height: widthDevice * 0.1,
                          decoration: const BoxDecoration(
                            color: kRed,
                            boxShadow: [
                              BoxShadow(
                                color: kBlack,
                                offset: Offset(-2, 3),
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Lanjut',
                              style: kSubtitle1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your score is: $score'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
