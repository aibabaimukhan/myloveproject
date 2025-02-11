import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

// список который принимает значение чтобы в дальнейшем отобразить 
  List items =  [];
  //  переменная которая будет принимать значение от инпута
  String inputText = '';
  // функция для добавления значения в список items
  void addItems(value){
    if(value.isNotEmpty) {
      setState(() {
        items.add(value);
      });
      inputText = '';  // очищаем поле ввода после добавления
    }else{
      // print('error');
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text('Поле ввода пустое'),
          );
        }
        );
    }
  }
  // функция для удаления значения из списока items
  void removeItems(int index) {
    setState(() {
      items.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar'), backgroundColor: Colors.deepOrangeAccent,),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return Padding(padding: EdgeInsets.all(10),
            child: ListTile(
              tileColor: Colors.green,
              title: Text( (items[index]).toString()),
              trailing: IconButton(
                onPressed: (){
                  removeItems(index);
              }, 
              icon: Icon(Icons.delete)),
            ),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                title: Text('Add context'),
                content: TextField(
                  onChanged: (value){
                    inputText = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      //  проверка на заполненность input-a
              
                        addItems(inputText);
                      
                      Navigator.of(context).pop();
                    }, 
                    child: Text('ADD'), 
                    ),
                ],
              );
            });
        },
        child: Icon(Icons.add),
        ),
    );
  }
}


// class HomeCount extends StatefulWidget {
//   const HomeCount({super.key});

//   @override
//   State<HomeCount> createState() => _HomeCountState();
// }

// class _HomeCountState extends State<HomeCount> {

//   List items = [1, 2, 3];

//   void add (){
//     setState(() {
//        items.add(items.length + 1);
//     });
//   }

//   void remove (){
//     setState(() {
//        items.removeLast();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('data'),
//         backgroundColor: Colors.deepOrangeAccent,
//         ),
//       body: ListView(
//         children: [
//           Text("Категории", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3, // Количество столбцов
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//             ),
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 color: Colors.blue,
//                 child: Column(
//                   children: [
//                     Center(child: Text("Элемент $index")),
//                     ElevatedButton(onPressed: (){
//                       remove();
//                     }, 
//                     child: Icon(Icons.delete)),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
// )
// ,
// floatingActionButton: FloatingActionButton(
//   onPressed: (){
//     add();
//   },
//   child: Icon(Icons.add),
// ),
//     );
//   }
// }


// class HomeCount extends StatefulWidget {
//   const HomeCount({super.key});

//   @override
//   State<HomeCount> createState() => _HomeCountState();
// }

// class _HomeCountState extends State<HomeCount> {
//   List<int> items = [1, 2, 3];
//   void addItems (){
//     setState(() {
//       items.add(items.length + 1);
//     });
//   }
//   void removeItems (int index) {
//     setState(() {
//       items.removeAt(index);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.deepOrangeAccent,
//         title: Text('data')
//         ),
//       body: Center(
//         child: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index){
//             return Padding(padding: EdgeInsets.all(10),
//             child: ListTile(
//               tileColor: Colors.green,
//               title: Text( (items[index]).toString()),
//               trailing: IconButton(
//                 onPressed: (){
//                   removeItems(index);
//               }, 
//               icon: Icon(Icons.delete)),
//             ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: addItems,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
