import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  String currentDate = DateFormat.yMMMd().format(DateTime.now());
  List<String> categories = ["Urgent", "Important", "Not Important"];

  //test data
  List<Todo> allTodos = [
    Todo(
        title: "Pohon Mangga",
        date: "Feb 2, 2023",
        time: "8:00 AM",
        description:
            "Pohon mangga adalah tanaman buah tropis yang berasal dari Asia. Dikenal dengan daunnya yang hijau mengilap dan buahnya yang manis, mangga menjadi tanaman produktif yang memberikan nuansa tropis di kebun atau pekarangan.",
        category: "Urgent"),
    Todo(
        title: "Anggrek",
        date: "Jan 27, 2023",
        time: "3:00 PM",
        description:
            "Anggrek merupakan tanaman hias berbunga cantik yang terkenal dengan keindahan dan keberagaman warna serta bentuk bunganya. Anggrek sering dijadikan simbol keindahan alam dan menjadi favorit dalam dunia florikultura",
        category: "Important"),
    Todo(
        title: "Pohon anggur",
        date: "Jan 30, 2023",
        time: "9:30 AM",
        description:
            "Pohon anggur adalah tanaman merambat yang menghasilkan buah anggur. Buah ini sering dijadikan bahan baku untuk pembuatan anggur dan produk-produk turunannya. Pohon anggur memiliki daun yang berbentuk lobus dan menjadi tanaman produktif dalam iklim yang sesuai.",
        category: "Urgent"),
    Todo(
        title: "Monstera",
        date: "Jan 28, 2023",
        time: "16:00 PM",
        description:
            "Monstera adalah tanaman hias daun yang populer karena daun besar dan uniknya yang berlubang-lubang. Tanaman ini memberikan sentuhan estetika tropis di dalam ruangan dan sering dipilih sebagai dekorasi interior.",
        category: "Not Important"),
    Todo(
        title: "Kaktus",
        date: "Jan 27, 2023",
        time: "5:00 PM",
        description:
            "Kaktus adalah tanaman tahan kering yang terkenal dengan batang berduri atau berbulu. Kaktus memiliki adaptasi khusus untuk bertahan hidup di lingkungan gersang dan sering dijadikan tanaman hias dalam pot.",
        category: "Not Important"),
    Todo(
        title: "lidah mertua",
        date: "Jan 28, 2023",
        time: "",
        description:
            "Lidah mertua, atau sansevieria, adalah tanaman hias yang mudah perawatannya. Dikenal dengan daunnya yang tegak dan ramping, lidah mertua cocok untuk ditempatkan di berbagai kondisi cahaya dan menjadi pilihan populer dalam dekorasi ruangan.",
        category: "Not Important"),
    Todo(
        title: "Bunga Mawar",
        date: "Jan 30, 2023",
        time: "5:00 PM",
        description:
            "Bunga mawar adalah simbol romantis dan keindahan. Tersedia dalam berbagai warna, bunga mawar sering dijadikan hadiah pada berbagai acara spesial. Tanaman ini memiliki bunga yang harum dan tampil indah di kebun atau taman bunga.",
        category: "Important"),
  ];

  List<Todo> get deletedTodos {
    return allTodos.where((element) => element.toBeDeleted).toList();
  }

  List<Todo> get completedTodos {
    return allTodos
        .where((element) => element.isComplete && !element.toBeDeleted)
        .toList();
  }

  void addTodo(String title, String description, String date, String time,
      String category) {
    allTodos.add(Todo(
        title: title,
        date: date,
        description: description,
        time: time,
        category: category));
    notifyListeners();
  }

  void toggleToBeDeleted(Todo todo) {
    todo.toBeDeleted = !todo.toBeDeleted;
    notifyListeners();
  }

  void toggleIsComplete(Todo todo) {
    todo.isComplete = !todo.isComplete;
    notifyListeners();
  }

  List<Todo> getSearchResults(String task) {
    return allTodos
        .where((element) =>
            RegExp(task, caseSensitive: false).hasMatch(element.title))
        .toList();
  }

  void addCategory(String category) {
    categories.add(category);
    notifyListeners();
  }

  void removeCategory(String category) {
    categories.remove(category);
    notifyListeners();
  }
}
