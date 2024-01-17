import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.cyan,
        primaryColor: Colors.indigo,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('我的自傳'),
          backgroundColor: Colors.lightBlue[300],
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.indigoAccent,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.grey[400],
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '自我介紹',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '學習歷程',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: '學習計畫',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.engineering),
              label: '專業方向',
            ),
          ],
          onTap: (index) {
            setState(() {
              previousIndex = currentIndex;
              currentIndex = index;
              if (index == 0) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('1.mp3'));
              }
              if (index == 1) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('2.mp3'));
              }
              if (index == 2) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('3.mp3'));
              }
              if (index == 3) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }

}

class screen1 extends StatelessWidget {
  final String s1 = '我是一位性格比較怕生的人，平時不太敢主動和別人交談，但其實內心非常渴望和他人交流的機會。我習慣獨處，但不是真的喜歡獨處，反而喜歡到處走走，感受人的氣息，就像在熱鬧的地方感受到人群的生動與活力。對於料理我可是相當熱愛的，最喜歡的樂趣就是看到別人嘗到我親手做的料理時露出的幸福臉龐。料理對我而言不僅是一種技能，更是表達愛意和關懷的方式。'
      '我是一個非常守規矩的人，無論是在道德上還是律法上，只要一不守規矩就會感到非常的罪惡感。這或許是我努力保持自己純潔和正直的原因之一。雖然我比較靦腆，但內心非常細膩，對於身邊的一點異常都會敏感地感知到。同時，我擁有豐富的同理心，對於那些有困難或是內心受到挫折的人，總是想要去做點什麼幫助他們的事情。朋友遇到問題時，我總是願意傾聽並給予支持。'
      '如果心情糟的話，我的表現可能會完全不一樣，可能會變得消極而沮喪。這是我一直在努力克服的一個方面，希望能夠學會更好地處理情緒，讓自己更加堅強。'
      '我的租屋處在高雄市三民區宿舍區，未婚。我在「國立高雄科技大學」上課，每天最晚也是八點前吃飯，不吸菸，酒也是淺嘗輒止，凌晨一點上床，保證六個小時的合理睡眠，睡前喝一杯冰開水，再滑二十分鐘社群軟體助眠，'
      '然後再睡覺，基本可以熟睡到天亮。像嬰兒一樣不留下疲勞與壓力，迎來第二天的早晨，健康檢查結果也顯示我很健康。'
      '我的意思是我是一個隨時都想追求平靜生活的人，不拘泥於勝負與煩惱，不樹立令我夜不能寐的敵人，這就是我對於這個社會的生活態度，我也清楚這就是我的幸福。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '自我介紹',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                s1,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          ClipOval(
            child: Container(
              color: Colors.white, // 新的颜色
              child: Image.asset(
                'assets/images/1.jpg',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCircularImage('assets/images/2.jpg'),
              _buildCircularImage('assets/images/3.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularImage(String imagePath) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.white), // 新的颜色
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '學習歷程檔案',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '中信國小',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '在中信國小的這段時間，我參與了學校的各項活動，包括美術或是語文競賽，培養了藝文類的素養。同時也透過學校暑期開設的資訊相關課程，學習到了基礎程式語法與剪輯修圖軟體的使用',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '中平國中',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '就讀中平國中時，班導的獨特教學方法，讓我對於理財和政治上有了不同的見解。學業上也因多元選才的緣故，有了更多不同方面的培養。',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '大安高工',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '在大安高工的階段，就讀的科系是我想挑戰自我的新領域，而因科系培養方針的緣故，我多方面學習到了許多不同科系有的知識，也培養了大量理工相關的學問。',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '高科大建工',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '進入高科大後，我科系上選擇了資訊工程系。在這裡，我活用了歷年來培養的基礎程式素養和知識，選修了各式各樣不同的資訊相關科目，豐富了自我對於資工領域的各項學問，也培養了與同學之間合作溝通的能力。',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String school, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            school,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTermSection('第一學年', [
              '專心學習',
              '培養人際關係',
            ]),
            SizedBox(height: 20),
            _buildTermSection('第二學年', [
              '深入資工領域',
              '保持成績不下降',
            ]),
            SizedBox(height: 20),
            _buildTermSection('第三學年', [
              '獲取多益畢業門檻',
              '完成學年度實務專題',
            ]),
            SizedBox(height: 20),
            _buildTermSection('第四學年', [
              '尋找校外實習',
              '攻讀科目',
              '考慮是否考公職',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildTermSection(String term, List<String> goals) {
    return Column(
      children: [
        Text(
          term,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(10),
          child: ListView(
            children: goals.map((goal) => _buildListItem(goal)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '專業方向',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 20),
          _buildListItem('多元知識及技能：包含剪輯影片，修改圖片，混音，生成圖像'
              '這些讓我能夠從事遊戲開發或多媒體設計，未來就業有更多的路可以走'),
          _buildListItem('網路爬蟲：獲取網站及網路上的各種數據，方面進行大數據研究及分析未來趨勢'),
          ClipOval(
            child: Container(
              color: Colors.white, // 新的颜色
              child: Image.asset(
                'assets/images/4.jpeg',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String itemText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Flexible(
            child: Text(
              itemText,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

