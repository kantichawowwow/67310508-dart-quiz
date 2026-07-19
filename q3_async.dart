import 'dart:async';
Future<Map<String, dynamic>> fetchOrder(int orderId) async {
  await Future.delayed(Duration(seconds: 2));

  if (orderId <= 0) {
    throw Exception('รหัสสั่งซื้อไม่ถูกต้อง');
  }
  return {
    'id': orderId,
    'menu': 'ลาเต้',
    'total': 65.0,
  };
}

Stream<String> trackOrder() async* {
  // ปล่อยข้อความสถานะ 3 ค่าตามลำดับ โดยเว้นระยะ 1 วินาทีก่อนปล่อยแต่ละค่า
  await Future.delayed(Duration(seconds: 1));
  yield 'รับออร์เดอร์แล้ว';

  await Future.delayed(Duration(seconds: 1));
  yield 'กำลังจัดทำ';

  await Future.delayed(Duration(seconds: 1));
  yield 'จัดส่งเรียบร้อย';
}

void main() async {
  print('เริ่มโหลดข้อมูล...');
  try {
    var order = await fetchOrder(7);
    print('ได้ข้อมูลออร์เดอร์: $order');
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    print('จบรายการ');
  }

  print('---'); 
  try {
    var order = await fetchOrder(0);
    print('ได้ข้อมูลออร์เดอร์: $order');
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    print('จบรายการ');
  }

  print('---');
  await for (var status in trackOrder()) {
    print('สถานะ: $status');
  }
  print('ติดตามสถานะเสร็จสิ้น');
}