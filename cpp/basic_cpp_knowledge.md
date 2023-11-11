# 容易忘记的CPP知识点

## class类型大小

### 空类大小

```cpp
#include <iostream>

class empty {
};

int main() {
    std::cout << "sizeof(class empty)=" << sizeof(class empty) << std::endl;
    return 0;
}
```
output:
```
sizeof(class empty)=1
```

空类大小非0，因为不同的对象需要不同的地址.  
但编译器会生成 6 个成员函数：缺省的构造函数、拷贝构造函数、析构函数、赋值运算符、两个取址运算符  

---

### 带有虚函数的类大小
```cpp
#include <iostream>

class base {
public:
    virtual void print() {
        std::cout << "base a=" << a << std::endl;
    }
    virtual void print_b() {}
    virtual void print_c() {}
    int a{};
};

class derive :public base{
   public:
    void print() override{
        std::cout << "derive a=" << a << std::endl;
    }
};

class normal {
public:
    void print() const {
        std::cout << "normal a=" << a << std::endl;
    }
    int a{};
};

int main() {
    derive test_d;
    std::cout << "sizeof(class base)=" << sizeof(base) << std::endl;
    std::cout << "sizeof(class derive)=" << sizeof(test_d) << std::endl;

    normal test_n;
    std::cout << "sizeof(class normal)=" << sizeof(test_n) << std::endl;
    return 0;
}

```

output:
```
sizeof(class base)=16
sizeof(class derive)=16
sizeof(class normal)=4
```
因为有虚函数，则类会有一个虚函数表，因此每个类实例有一个指针指向它的虚函数表，所以多出8个字节，又由于按照8字节对齐，所以base和derive为16字节。若强制1字节对齐，则为12字节

```cpp
#include <iostream>

#pragma pack(1) //强制1字节对齐
class base {
public:

    virtual void print() {
        std::cout << "base a=" << a << std::endl;
    }
    virtual void print_b() {}
    virtual void print_c() {}
    int a{0};
};

class derive :public base{
   public:
    void print() override{
        std::cout << "derive a=" << a << std::endl;
    }
};

class normal {
public:
    void print() const {
        std::cout << "normal a=" << a << std::endl;
    }
    int a{0};
};
#pragma pack() //取消指定对齐，恢复缺省对齐

int main() {
    derive test_d;
    std::cout << "sizeof(class base)=" << sizeof(base) << std::endl;
    std::cout << "sizeof(class derive)=" << sizeof(test_d) << std::endl;
    std::cout << "&test_d=" << &test_d << std::endl;
    std::cout << "&test_d.a=" << &test_d.a << std::endl;
    std::cout << "gap =" << (char *)(&test_d.a) - (char *)(&test_d)  << std::endl;

    normal test_n;
    std::cout << "sizeof(class normal)=" << sizeof(test_n) << std::endl;
    return 0;
}
```

output:
```
sizeof(class base)=12
sizeof(class derive)=12
&test_d=0x7ffe1ab391fc
&test_d.a=0x7ffe1ab39204
gap =8
sizeof(class normal)=4

```
可以看到类中虚函数表的指针在类地址的头部位置

---
## enum class 用法
```cpp
 #include <cstring>
#include <iostream>

enum class test { a, b=20, c, d };

struct st_test {
  int ast;
  test t;
};

int main() {
  std::cout << "test::a = " << static_cast<int>(test::a) << std::endl;
  std::cout << "test::b = " << static_cast<int>(test::b) << std::endl;
  std::cout << "test::c = " << static_cast<int>(test::c) << std::endl;
  std::cout << "test::d = " << static_cast<int>(test::d) << std::endl;

  std::cout << "sizeof(test) = " << sizeof(test) << std::endl;
  std::cout << "sizeof(test::a) = " << sizeof(test::a) << std::endl;

  std::cout << "sizeof(st_test) = " << sizeof(st_test) << std::endl;

  st_test st{1, test::c};
  st_test st2 = st;
  memset(&st, 0, sizeof(st_test));
  std::cout << "st.ast = " << st.ast << std::endl;
  std::cout << "st.t = " << static_cast<int>(st.t) << std::endl;

  std::cout << "st2.ast = " << st2.ast << std::endl;
  std::cout << "st2.t = " << static_cast<int>(st2.t) << std::endl;
}

```
output:
```
test::a = 0
test::b = 20
test::c = 21
test::d = 22
sizeof(test) = 4
sizeof(test::a) = 4
sizeof(st_test) = 8
st.ast = 0
st.t = 0
st2.ast = 1
st2.t = 21
```

## 声明问题
可以重复声明有很多次，但定义只能有一次。另外类型只有定义以后，才能被使用，而函数则不然，可以只要声明了就可以被使用
```cpp
#include <iostream>
void my_print();

void my_print();

void my_print();

struct test;

struct test;

int main() {
    my_print();
    return 0;
}

struct test {
    int a;
    int b;
};

void my_print(){
    struct test t;
    t.a = 10;
    std::cout << "Hello, World! a=" <<  t.a <<std::endl;
}

```
output:
```
Hello, World! a=10
```