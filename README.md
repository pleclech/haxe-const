haxe-const
==========

Constants implemented for Haxe language with help of abstracts<br>
Maybe you want macro version instead?

<a href="http://peyty.github.io#donate"><img src="http://peyty.github.io/images/donate.png"></a>
<a href="http://peyty.github.io#hireme"><img src="http://peyty.github.io/images/hireme.png"></a>

Installation & Usage
=====
Quick install:
```
haxelib git haxeconst https://github.com/PeyTy/haxe-const.git
```
Quick update:
```
haxelib update haxeconst
```
Add to build.hxml:
```
-lib haxeconst
```
No ```import``` required if you use OOP syntax: ```var c = new Const(value);```
For short functional syntax, use  ```import Const.Tools.const;``` and then ```var c = const(value);```

Just create instance of Const class or use function ```const``` from ```import Const.Tools.const;```:

```haxe
// Ints:
var c = const(56);
// same as:
var c = new Const(56);
// c = 7; error!
// c++; error! No A++ ++A A-- --A for consts!
var x:Int = c;
trace(c+1);
trace(c*10);
trace(c/10);
trace(c-1);
trace(1-c);

// Floats:
var c = new Const(56.65);
// c = 123.456; error!
var x:Float = c;
trace(c+1);
trace(c*10);
trace(c/10.0);
trace(c-1);

// Strings:
var s = new Const("hello");
// s = "string"; error!
trace(s);
trace(s.length);

// Arrays:
var a = new Const([1,2,3]);
// a = [1]; error!
a.push(4);
trace(a);
trace(a.length);
var ar:Array<Int> = a;

// Anything:

class Demo {
	public var a:Int = 100;
	public var b = new Const({ hello : "hi!" });
}

var demo = new Const(new Demo());
// demo = new Demo(); error!
// demo.b = { hello : "um?" }; error!
trace(demo);
trace(demo.a);
demo.a = 101;
trace(demo.b.hello);
demo.b.hello = "hi-hi";
```

Hacking Consts (can be useful)
=====
```haxe
// The Only Hack =)
demo = new Const(new Demo()); // where demo -> already instantiated Const

// Function arguments:
function test(const:Const<Int>){
	// const = 7; error!
	trace(const); // 42 OK
}
test(new Const(42));
```

Known Bugs *!need help!*
=====
```haxe
// Ints:
var c = new Const(56);
var x:Int = c;
trace(x+c); // bug
trace(-c); // bug
```

```haxe
// Floats:
var c = new Const(56.65);
var x:Float = c;
trace(x-c); // bug
trace(x+c); // bug
trace(-c); // bug
```
