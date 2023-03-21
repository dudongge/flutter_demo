
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
   final scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final comicTitles = [
    '动漫肖像',
    '暴君闺女五岁半',
    '爱丽丝梦游仙境',
    '世界经典童话',
    '恐龙漫画',
    '尼罗河女儿',
    '神经网络与深度学习',
    '重庆迷城'
  ];
  final comicSubtitles = [
    '大鹏一日同风起，扶摇直上九万里',
    '话说 在一个风雨交加的晚上，皇宫内传来阵阵脚本声，只听哇的一声，一个漂亮的小女孩诞生了',
    '是十九世纪英国作家刘易斯·卡罗尔所著的著名儿童文学作品《爱丽丝梦游仙境》和《爱丽丝镜中奇遇记》中的主角',
    '《世界十大经典童话》是2003年1月郑州大学出版社出版的图书，作者是邓书杰等。 本书收录世界童话宝库中影响最深远、流传最广泛的经典之作：《一千零一夜',
    '经典恐龙漫画故事（上册）（全彩）》是2013年9月电子工业出版社出版的图书，作者是夏峥',
    '尼罗河女儿一般指王家的纹章。 《王家的纹章》是日本“细川智荣子和芙美子”俩姐妹创作的漫画，于1976年开始在日本漫..',
    '《神经网络与深度学习》是一部由浅入深地阐述深度学习的原理、模型以及方法的著作，由机械工业出版社出版，复旦大学教授邱锡鹏撰写',
    '《重庆迷城》由作者E伯爵创作，上海紫焰文化传媒有限公司出品，重庆出版社出版。《重庆迷城》是一部只能发生在“3D立体”重庆的科幻小说，'
  ];
  final comicAuthors = ['庄子', '暴君叔叔', '刘易斯*卡罗尔', '邓书杰', '夏峥', '细川智荣子 芙美子', '教授邱锡鹏', 'E伯爵'];
  final comicCovers = [
    'http://t13.baidu.com/it/u=2480172160,1791555484&fm=224&app=112&f=JPEG?w=200&h=200',
    'https://pics5.baidu.com/feed/aa64034f78f0f736c626a1ddc972401ee9c413c5.jpeg?token=e68bb3fc4d1b37e2a4a55d72ecc60420&s=7B8C668F55C2ECF9288768FB0300C078',
    'http://t14.baidu.com/it/u=469621631,20563564&fm=224&app=112&f=JPEG?w=200&h=200',
    'http://t14.baidu.com/it/u=1492083614,2295131507&fm=224&app=112&f=JPEG?w=150&h=217',
    'http://t14.baidu.com/it/u=1105282303,1369058115&fm=224&app=112&f=JPEG?w=200&h=200',
    'http://t14.baidu.com/it/u=3080817426,1036805122&fm=224&app=112&f=JPEG?w=150&h=222',
    'https://img11.360buyimg.com/n1/s170x170_jfs/t1/40050/30/1552/101456/5cbd7b15E281ee540/dfabe27c1e166f33.jpg',
    'https://n.sinaimg.cn/spider20230304/393/w168h225/20230304/c334-8e6759f57c1b26eb01f314763ac294ce.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return  _buildHomeScaffoldPage();
  }

  Widget _buildHomeScaffoldPage() {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            indicatorColor: Colors.black45,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black26,
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: "男生",
              ),
              Tab(
                text: "女生",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  <Widget>[
                Center(
                  child: _buildCustomScrollView(),
                ),
                Center(
                  child: _buildGridView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildHomeListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          height: 80,
          child: Row(
            children: [
              Container(
                color: Colors.black12,
                width: 50,
                child: Image.network(comicCovers[index],fit: BoxFit.fitWidth,),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    comicTitles[index],
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 80),
                    child:  Text(
                      comicSubtitles[index],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.black26),
                    ),
                  ),
                  const Spacer(),
                  Text(comicAuthors[index], style: TextStyle(fontSize: 12, color: Colors.black26))
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  GridView _buildGridView() {
      final itemW = (MediaQuery.of(context).size.width - 8 * 3 - 16 * 2) / 4;
      final coverH = itemW / 80 * 90;
      return GridView.builder(
          padding: const EdgeInsets.only(top: 16.0,left: 8,right: 8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            childAspectRatio: itemW / (coverH + 50),
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: coverH,
                  width: itemW,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    // color: Colors.black45,
                  ),
                  child: Image.network(comicCovers[index],fit: BoxFit.fitHeight,),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(constraints:BoxConstraints(maxWidth: itemW), child: Text(comicTitles[index],maxLines: 2,overflow: TextOverflow.ellipsis,))
              ],
            );
          });
    }

  Widget _buildCustomScrollView() {
    return CustomScrollView(
        controller: ScrollController(),
        key: const ValueKey(#customScroll),
        slivers: [
          SliverToBoxAdapter(
            child: _buildGridView(),
          ),
          SliverToBoxAdapter(
            child: _buildHomeListView(),
          ),
        ]);
  }
}



