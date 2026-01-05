# Tìm hiểu về Nullable

### Thế nào là Nullable

-   Nullable là kiểu dữ liệu chứa dữ liệu được định nghĩa hoặc giá trị null. Nói cách khác nó sẽ cho phép một biến chứa giá trị null ( rỗng/không có giá trị)
-   Khi muốn biểu thị "không có giá trị" hoặc "giá trị chưa được gán"

### Khi nào nên / không nên dùng

Nên dùng nullable khi:

-   Dữ liệu có thể chưa tồn tại (User chưa đăng nhập, API chưa trả về).
-   Các trường hợp optional trong model (địa chỉ phụ, số điện thoại phụ).
-   Giá trị có thể bị xóa hoặc reset về trạng thái "không có".
-   Kết quả tìm kiếm có thể không tìm thấy.

Không nên dùng nullable khi:

-   Dữ liệu bắt buộc phải có (ID, tên user, email đã đăng ký).
-   Có thể dùng giá trị mặc định thay vì null (ví dụ: "" thay vì String?).
-   Làm code phức tạp không cần thiết.

Lưu ý:

```bash
    không phải lúc nào id luôn luôn là unique,  nên là null nếu thông qua http, không chắc chắn nó có không thì nên khai báo optional -> crash(màn hình thông báo closeApp()).
    - vd: data trả value về mobie thì không chắc nên cần ?
```

```bash


```

### Cách thức xử lý phổ biến như: ?, ?., ?:, let, !! (các cách thức xử lý nullable of dart)

1. Khai báo nullable type: ?

```dart
    int? score; //có thể null
    String? name; //có thể null
```

2. Safe call operator (gọi an toàn): ?.

```dart
    String? name = null;
    int? length = name?.length; //trả về null thay vì crash(dừng đột ngột)
```

3. Null-aware operator (giá trị mặc định): ??

```dart
    String? name; //có thể null
    name ??= "Default"; //trả về Default nếu name đang null
```

4. Null assertion (khẳng định không null): !

```dart
String? name = "John";
String definiteName = name!; // Báo cho Dart biết chắc chắn không null
```

5. Check null thông qua biến null:

```dart
String? name = 'kiet';
if (name != null) {
    print(name.length);
}
```

### Dựng một màn hình ví dụ
