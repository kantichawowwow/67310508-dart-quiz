enum OrderStatus {pending,paid,cancalled}
abstract class MenuItem {
  final String name ;
  final double basePrice ;

  static int itemCount = 0;
  MenuItem(this.name, this.basePrice){
    itemCount++;
  }

  double price();
  void show(){
    print("$name - ${price()}");
  }

}
class Drink extends MenuItem{
  int toppings ;
  Drink(String name,double beasPrice,this.toppings)
    :super(name,beasPrice);
  @override
  double price(){
    double price = basePrice+(10*toppings);
    return price;
  }
}
class Food extends MenuItem{
  String size ;
  Food(String name,double beasPrice,this.size)
    :super(name,beasPrice);
  @override
  double price(){
    double value;
    switch (size) {
      case 'S':
      value = 1.0;
      break;
      case 'M':
      value = 1.2;
      break;
      case 'L':
      value = 1.5;
      break;
    default:value = 1.0;
    }
    return basePrice*value;
  }
}
class Wallet {
  double _balance;
  Wallet(this._balance);
  double get balance => _balance;
  set balance(double value){
    if(value<0){
      print("ผิดพลาด: ยอดเงินติดลบไม่ได้");
    }else{
      _balance=value;
    }
  }
  bool pay(double amount){
    if(amount < _balance){
      print("ยอดเงินไม่พอ");
      return false;
    }else{
      amount -= _balance;
      print("ชำระเงินสำเร็จ");
      return true;
    }
  }
}
String getStatusText(OrderStatus status){
  switch (status){
    case OrderStatus.pending:
    return "รอชำระเงิน";
    case OrderStatus.paid:
    return "ชำระเงินแล้ว";
    case OrderStatus.cancalled:
    return "ยกเลิกคำสั่งซื้อ";
  }
}
void main(){
  List<MenuItem> order = [];
  order.add(Drink("ลาเต้", 65,0));
  order.add(Food("ข้าวผัด", 90,""));
  order.add(Drink("อเมริกาโน่", 45, 0));
  double total = 0 ;
  for (var item in order){
    item.show();
    total += item.price();
  }
  print("ยอดรวมทั้งสิ้น: $total บาท");
  print("-----");

  Wallet wallet = Wallet(100);
  wallet.balance = -50;

  OrderStatus status;
  if(wallet.pay(total)){
    status = OrderStatus.paid;
  }else{
    status = OrderStatus.pending;
  }
  print("สถานะ: ${getStatusText(status)}");
  print('ยอดคงเหลือ: ${wallet.balance}');

  if (!wallet.pay(50)){
    status = OrderStatus.pending;
  }
  print("สถานะ: ${getStatusText(status)}");
  print('ยอดคงเหลือ: ${wallet.balance}');

  print("-----");
  print("จำนวนรายการเมนูที่สร้าง: ${MenuItem.itemCount}");
}


