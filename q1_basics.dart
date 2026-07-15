void calcTotal(){
  const double vatRate = 0.07 ;
  print("อัตราภาษี (vatRate): $vatRate");
}
void main(){
  final String shopName = "Dart Cafe";
  print("ร้าน: $shopName ");
  calcTotal();

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
  print("ราคาข้าวผัด : ${menu["ข้าวผัด"]} บาท");
  print("-----");
  print("หมวดราคาตั้งแต่ 50 บาทขึ้นไป:");
  
  for (var menus in {menu}) {
    menu.forEach((key, value){
    if (value >= 50){
      print("ชื่อเมนู : $key ราคา $value บาท");
    }
  });
  }

  
}