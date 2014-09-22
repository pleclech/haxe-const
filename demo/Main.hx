/*

	Haxe constants usage demo

*/

class Demo {
	public var a:Int = 100;
	public var b = new Const({ hello : "hi!" });
}

class Main {
	public static function main() {
		trace("Haxe is great!");

		// Ints:
		var c = new Const(56);
		// c = 7; error!
		// c++; error! No A++ ++A A-- --A for consts!
		var x:Int = c;
		trace(c+x);
		//trace(x+c); // bug
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
		//trace(x+c); // bug
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
		var demo = new Const(new Demo());
		// demo = new Demo(); error!
		// demo.b = { hello : "um?" }; error!
		trace(demo);
		trace(demo.a);
		demo.a = 101;
		trace(demo.b.hello);
		demo.b.hello = "hi-hi";

		// The Only Hack =)
		demo = new Const(new Demo());
	}
}