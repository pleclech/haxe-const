/*

	Haxe constants usage demo

*/

import Const.Tools.const;

class Demo {
	public var a:Int = 100;
	public var b = new Const({ hello : "hi!" });
}

class Main {
	public static function main() {
		trace("Haxe is great!");

		// short syntax:
		var c = const("constant");
		var c = const([123]);
		var c = const(new Demo());
		var c = const(123);
		trace(c);

		// Ints:
		var c = new Const(56);
		// c = 7; error!
		// c++; error! No A++ ++A A-- --A for consts!
		var x:Int = c;
		trace(c+x);

		// using const value:

		//trace(x+c); // bug
		trace(x+c.value); // ok

		//c.value++; // error! No A++ ++A A-- --A for consts values!

		trace(c+1);
		trace(c*10);
		trace(c/10);
		trace(c-1);
		trace(1-c);

		// Floats:
		var c = new Const(56.65);
		// c = 123.456; error!
		var x:Float = c;
		//trace(x-c); // bug
		trace(x-c.value); // ok
		//trace(x+c); // bug
		trace(x+c.value); // ok
		trace(c+1);
		trace(c*10);
		trace(c/10.0);
		trace(c-1);

		// Strings:
		var s = new Const("hello");
		// s = "string"; error!
		trace(s);
		trace(s.length);
		trace("hi: " + s);
		trace(s + "!");

		// Arrays:
		var a = new Const([1,2,3]);
		// a = [1]; error!
		a.push(4);
		trace(a);
		trace(a.length);
		var ar:Array<Int> = a;

		// Anything:
		var demo = new Const(new Demo());
		// demo = new Demo(); error!
		// demo.b = { hello : "um?" }; error!
		trace(demo);
		trace(demo.a);
		demo.a = 101;
		trace(demo.b.hello);
		demo.b.hello = "hi-hi";

		// Function arguments:
		function test(const:Const<Int>){
			// const = 7; error!
			trace(const); // 42 OK
		}
		test(new Const(42));

		// The Only Hack =)
		demo = new Const(new Demo());
		// or
		demo = const(new Demo());
	}
}