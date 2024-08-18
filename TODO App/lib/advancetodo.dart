import 'package:advance_todo_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class AdvanceTodo extends StatefulWidget {
  const AdvanceTodo({super.key});

  @override
  State createState() => _AdvanceTodoState();
}

class _AdvanceTodoState extends State {
  bool check = false;
  //int? length;

  // @override
  // void initState() {
  //   super.initState();
  //   setInitialization();
  // }

  // void setInitialization() async {
  //   listdata = await getdata();
  // }

  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> showBottomSht(bool doEdit, [ToDo? todoobj]) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              doEdit
                  ? Text(
                      "Edit Task",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    )
                  : Text(
                      "Create Task",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xff80BCBD),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        //labelText: "Enter Title",
                        hintText: "Enter Title",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xff80BCBD),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Title";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xff80BCBD),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        // labelText: "Enter Description",
                        hintText: "Enter Description",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xff80BCBD),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Description";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xff80BCBD),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextFormField(
                        controller: dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          //labelText: "Select Date",
                          hintText: "Enter Date",
                          suffixIcon: const Icon(Icons.date_range_rounded),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xff80BCBD),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2025),
                          );
                          String formatedDate =
                              DateFormat.yMMMd().format(pickedDate!);
                          setState(() {
                            dateController.text = formatedDate;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select date";
                          } else {
                            return null;
                          }
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        13,
                      ),
                    ),
                    backgroundColor: const Color(0xff80BCBD),
                  ),
                  onPressed: () {
                    bool validstate = _formKey.currentState!.validate();
                    if (validstate) {
                      doEdit ? submit(doEdit, todoobj) : submit(doEdit);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please fill All Fields')));
                    }
                  },
                  child: Text(
                    "Submit",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

//submit function to add data in database
  void submit(bool doEdit, [ToDo? todoobj]) async {
    if (!doEdit) {
      await insertintoToDo(ToDo(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          date: dateController.text.trim(),
          done: false));
      setState(() {});
    } else {
      todoobj!.date = dateController.text.trim();
      todoobj.title = titleController.text.trim();
      todoobj.description = descriptionController.text.trim();
      await updatedatabase(todoobj);
      setState(() {});
    }

    clearController();
  }

  //Clear TextControllers which is filled in edit
  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  //edit task
  void editTask(ToDo todoobj) async {
    titleController.text = todoobj.title;
    descriptionController.text = todoobj.description;
    dateController.text = todoobj.date;
    await showBottomSht(true, todoobj);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff80BCBD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          Container(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello ,",
                      style: GoogleFonts.quicksand(
                          fontSize: 27, fontWeight: FontWeight.w500)),
                  Text("Ashutosh",
                      style: GoogleFonts.quicksand(
                          fontSize: 37, fontWeight: FontWeight.w600))
                ],
              )),
          const SizedBox(height: 60),
          Expanded(
            child: Container(
              // width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text("CREATE TODO LIST",
                      style: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 30),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                          color: Colors.white),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          listdata = await getdata();
                          setState(() {});
                        },
                        child: ListView.builder(
                            itemCount: listdata.length,
                            itemBuilder: (context, index) {
                              return Slidable(
                                  closeOnScroll: true,
                                  endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const DrawerMotion(),
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(
                                              height: 0,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                editTask(listdata[index]);
                                                setState(() {});
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    right: 15, left: 8),
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff80BCBD),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                await deletedata(
                                                    listdata[index]);

                                                setState(() {});
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff80BCBD),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  key: ValueKey(index),
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 0, bottom: 20),
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.08),
                                                offset: Offset(4, 4),
                                                blurRadius: 20)
                                          ]),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 52,
                                            height: 52,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 1)),
                                            child: Image.asset(
                                              "assets/checklist.gif",
                                              width: 24,
                                              height: 20,
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 15),
                                                Text(
                                                  listdata[index].title,
                                                  style: GoogleFonts.quicksand(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  listdata[index].description,
                                                  style: GoogleFonts.quicksand(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  listdata[index].date,
                                                  style: GoogleFonts.quicksand(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 11),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                          Checkbox(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              activeColor:
                                                  const Color(0xff80BCBD),
                                              value: listdata[index].done,
                                              onChanged: (value) {
                                                setState(() {
                                                  listdata[index].done =
                                                      !listdata[index].done;
                                                  setState(() {
                                                    updatedatabase(
                                                        listdata[index]);
                                                  });
                                                });
                                              })
                                        ],
                                      )));
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          clearController();
          await showBottomSht(false);
        },
        backgroundColor: const Color(0xff80BCBD),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
