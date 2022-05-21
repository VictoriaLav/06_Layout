import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> data = getListWidget(20);
  List<Widget> dataSeparated = getListSeparated(19);
  List<Widget> dataGradient = getListGradient(10);
  ScrollController controller = ScrollController(initialScrollOffset: 0);
  final PageController _pageController = PageController();
  final styleBorder = OutlineInputBorder(
    gapPadding: 20,
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.purple,
      width: 2.0,
    ),
  );

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print('initState');
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson 6'),
      ),
      body:
      PageView(
        controller: _pageController,
        onPageChanged: (index) {},
        children: <Widget>[

          // Задание 1
          Column(
            children: [
              Text(
                  'Задание 1',
                  style: TextStyle(
                    fontSize: 20,
                  ),
              ),
              Expanded(
                child: ListView.separated(
                  controller: controller,
                  itemCount: data.length,
                  itemBuilder: (context, index) => data[index],
                  separatorBuilder: (context, index) => dataSeparated[index],
                ),
              ),
            ],
          ),


          // Задание 2
          CustomScrollView( //область, в которой прокручиваются все ее элементы
                slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Задание 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  background: Stack(
                    children: <Widget>[
                      Image.network(
                        'https://picsum.photos/1200/500',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        child: Container(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Однажды весною, в час небывало жаркого заката, в Москве, на Патриарших прудах, появились два гражданина. Первый из них, одетый в летнюю серенькую пару, был маленького роста, упитан, лыс, свою приличную шляпу пирожком нес в руке, а на хорошо выбритом лице его помещались сверхъестественных размеров очки в черной роговой оправе. Второй – плечистый, рыжеватый, вихрастый молодой человек в заломленной на затылок клетчатой кепке – был в ковбойке, жеваных белых брюках и в черных тапочках.'
                  'Первый был не кто иной, как Михаил Александрович Берлиоз, председатель правления одной из крупнейших московских литературных ассоциаций, сокращенно именуемой МАССОЛИТ, и редактор толстого художественного журнала, а молодой спутник его – поэт Иван Николаевич Понырев, пишущий под псевдонимом Бездомный.'
                  'Попав в тень чуть зеленеющих лип, писатели первым долгом бросились к пестро раскрашенной будочке с надписью «Пиво и воды».'
                  'Да, следует отметить первую странность этого страшного майского вечера. Не только у будочки, но и во всей аллее, параллельной Малой Бронной улице, не оказалось ни одного человека. В тот час, когда уж, кажется, и сил не было дышать, когда солнце, раскалив Москву, в сухом тумане валилось куда-то за Садовое кольцо, – никто не пришел под липы, никто не сел на скамейку, пуста была аллея.'
                  '– Дайте нарзану, – попросил Берлиоз.'
                  '– Нарзану нету, – ответила женщина в будочке и почему-то обиделась.'
                  '– Пиво есть? – сиплым голосом осведомился Бездомный.'
                  '– Пиво привезут к вечеру, – ответила женщина.'
                  '– А что есть? – спросил Берлиоз.'
                  '– Абрикосовая, только теплая, – сказала женщина.'
                  '– Ну, давайте, давайте, давайте!..'
                  'Абрикосовая дала обильную желтую пену, и в воздухе запахло парикмахерской. Напившись, литераторы немедленно начали икать, расплатились и уселись на скамейке лицом к пруду и спиной к Бронной.'
                  'Тут приключилась вторая странность, касающаяся одного Берлиоза. Он внезапно перестал икать, сердце его стукнуло и на мгновенье куда-то провалилось, потом вернулось, но с тупой иглой, засевшей в нем. Кроме того, Берлиоза охватил необоснованный, но столь сильный страх, что ему захотелось тотчас же бежать с Патриарших без оглядки. Берлиоз тоскливо оглянулся, не понимая, что его напугало. Он побледнел, вытер лоб платком, подумал: «Что это со мной? Этого никогда не было... сердце шалит... я переутомился. Пожалуй, пора бросить все к черту и в Кисловодск...»'
                  'И тут знойный воздух сгустился перед ним, и соткался из этого воздуха прозрачный гражданин престранного вида. На маленькой головке жокейский картузик, клетчатый кургузый воздушный же пиджачок... Гражданин ростом в сажень, но в плечах узок, худ неимоверно, и физиономия, прошу заметить, глумливая.'
                  'Жизнь Берлиоза складывалась так, что к необыкновенным явлениям он не привык. Еще более побледнев, он вытаращил глаза и в смятении подумал: «Этого не может быть!..»'
                  'Но это, увы, было, и длинный, сквозь которого видно, гражданин, не касаясь земли, качался перед ним и влево и вправо.'
                  'Тут ужас до того овладел Берлиозом, что он закрыл глаза. А когда он их открыл, увидел, что все кончилось, марево растворилось, клетчатый исчез, а заодно и тупая игла выскочила из сердца.'
                  '– Фу ты черт! – воскликнул редактор, – ты знаешь, Иван, у меня сейчас едва удар от жары не сделался! Даже что-то вроде галлюцинации было, – он попытался усмехнуться, но в глазах его еще прыгала тревога, и руки дрожали.'
                  'Однако постепенно он успокоился, обмахнулся платком и, произнеся довольно бодро: «Ну-с, итак...» – повел речь, прерванную питьем абрикосовой.',
                ),
              ),
            ],
          ),


          // Задание 3
          Column(
            children: [
              Text(
                'Задание 3',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child:
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double _width = constraints.constrainWidth();
                    return _width > 500
                        ? GridView.count(
                            crossAxisCount: 1,
                            childAspectRatio: 8,
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              ...dataGradient.map((item) => item).toList(),
                            ],
                          )
                       :
                          Column(
                            children: [
                              Container(
                                height: 100,
                                child: ListView(
                                  controller: controller,
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    ...dataGradient
                                        .map(
                                          (item) => Container(
                                            width: 100,
                                            child: item,
                                          ),
                                        )
                                        .toList(),
                                  ],
                                ),
                              ),
                              Container(),
                            ],
                          );
                  },
                ),
              ),
            ],
          ),


          // Задание 4
          Column(
              children: [
                Text(
                  'Задание 4',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      flex: 25,
                      child: TextField(
                        obscureText: false,
                        style: TextStyle(color: Colors.purple),
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsetsGeometry.infinity,
                          labelText: 'Search',
                          labelStyle: TextStyle(color: Colors.purple),
                          helperText: 'Поле для поиска заметок',
                          hintText: 'Введите значение',
                          focusedBorder: styleBorder,
                          enabledBorder: styleBorder,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ],
          ),


        ],
      ),
    );
  }
}
