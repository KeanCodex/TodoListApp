import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Components/cust_text.dart';
import 'package:flutter_todo_app/Components/cust_textfield.dart';
import 'package:flutter_todo_app/Model/list_model.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoAppScreen extends StatefulWidget {
  const TodoAppScreen({super.key});

  @override
  State<TodoAppScreen> createState() => _TodoAppScreenState();
}

class _TodoAppScreenState extends State<TodoAppScreen> {
  final TitleController = TextEditingController();
  final DescController = TextEditingController();

  List<bool> todoCheck = [];
  List<ItemModel> todoItem = [];
  void toAddList() {
    setState(() {
      if (TitleController.text.isNotEmpty && DescController.text.isNotEmpty) {
        todoItem.add(ItemModel(
            title: TitleController.text, descript: DescController.text));
        todoCheck.add(false);
        TitleController.clear();
        DescController.clear();
      }
    });
  }

  void toDeleteList() {
    setState(() {
      for (int x = todoItem.length - 1; x >= 0; x--) {
        if (todoCheck[x]) {
          todoItem.removeAt(x);
          todoCheck.removeAt(x);
        }
      }
    });
  }

  void toCheckList(int index, bool newValue) {
    setState(() {
      todoCheck[index] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blueGrey,
        leading: const Icon(Icons.check_circle_outline, color: Colors.white),
        title: CustText(
            label: "Shopping List",
            fontcolor: Colors.white,
            fontsize: 18,
            fontweight: FontWeight.w500),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: toDeleteList,
              icon: const Icon(
                Icons.cleaning_services_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Material(
              elevation: 3,
              child: SizedBox(
                height: 230,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustTextfield(
                          controller: TitleController, label: 'Title'),
                      const Gap(10),
                      CustTextfield(
                          controller: DescController, label: 'Description'),
                      const Gap(10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: toAddList,
                          style: ButtonStyle(
                              padding: const WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(horizontal: 30)),
                              shape: WidgetStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                              side: const WidgetStatePropertyAll(
                                  BorderSide(color: Colors.blueGrey))),
                          child: CustText(
                              label: "Add",
                              fontcolor: Colors.blueGrey,
                              fontsize: 17,
                              fontweight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(15),
            todoItem.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: Colors.blueGrey[200],
                        size: 50,
                      ),
                      CustText(
                        label: 'No item found...',
                        fontsize: 15,
                        fontcolor: Colors.blueGrey,
                      ),
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: todoItem.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      todoItem[index].title,
                                      style: GoogleFonts.inter(
                                        decoration: todoCheck[index]
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    Text(
                                      todoItem[index].descript,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'asset/image/Arnie.png',
                                  ),
                                ),
                                trailing: Checkbox(
                                    value: todoCheck[index],
                                    onChanged: (newValue) =>
                                        toCheckList(index, newValue!)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
