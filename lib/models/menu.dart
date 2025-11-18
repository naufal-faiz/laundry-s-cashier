class Menu {
  String id;
  String name;
  double price;

  Menu({
    required this.id,
    required this.name,
    required this.price,
  });
}

final List<Menu> menuList = [
  Menu(id: '1', name: 'Cuci Kering', price: 5000),
  Menu(id: '2', name: 'Cuci Setrika', price: 8000),
  Menu(id: '3', name: 'Setrika Saja', price: 4000),
];