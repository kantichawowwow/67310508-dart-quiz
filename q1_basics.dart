const double vatRate = 0.07 ;
double calcTotal({required int price, required int qty,double discount = 0.0}){
  double total = ((price*qty)-discount)*(1+vatRate);
  return total;
}
void main(){
  final String shopName = "Dart Cafe";
  print("ร้าน: $shopName ");
  print("อัตราภาษี (vatRate): $vatRate");

  List<String> categories = ["เครื่องดื่ม","ของคาว","ของหวาน"];
  Map<String,int> menu = {
    "ข้าวผัด" : 45,
    "ผัดกะเพราทะเล" : 55,
    "บัวลอยไข่หวาน" : 40,
    "สมูตตี้กีวี่" : 60,
  };
  print("-----");
  print("หมวดเมนู: $categories");
  print("จำนวนเมนูทั้งหมด: ${menu.length} รายการ");
  print("ราคาข้าวผัด: ${menu["ข้าวผัด"]} บาท");
  print("-----");
  print("หมวดราคาตั้งแต่ 50 บาทขึ้นไป:");
  for (MapEntry<String,int> entry in menu.entries) {
    if (entry.value >= 50){
      print("${entry.key} : ${entry.value} บาท");
    }
  }
  print("-----");
  double totalPrice = calcTotal(price: 55, qty: 2);
  print("ยอดสุทธิ (ไม่มีส่วนลด): $totalPrice บาท");
  double totalPrice1 = calcTotal(price: 55, qty: 2,discount: 10);
  print("ยอดสุทธิ (ส่วนลด 10 บาท): $totalPrice1 บาท");

  print("-----");
  String? coupon;
  coupon ??= "0";
  print("ความยาวคูปอง: $coupon");
  coupon = "NO-COUPON";
  print("คูปองหลังกำหนดค่า: $coupon");
}

  
