/* The MIT License (MIT)

Copyright (c) 2014 Oleg

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. */

@:forward
abstract Const<T>(T) to T {
    public inline function new(inst:T)
    {
        this = inst;
    }
    // A+B
    @:op(A+B)
    public inline function add(rhs:Int) {
    	var t:Int = cast this;
    	return t + rhs;
    }
    @:op(A+B)
    public inline function addF(rhs:Float) {
    	var t:Float = cast this;
    	return t + rhs;
    }
    // A*B
    @:op(A*B)
    public inline function mul(rhs:Int):Int {
    	var t:Int = cast this;
    	var r:Int = cast rhs;
    	return t * r;
    }
    @:op(A*B)
    public inline function mulF(rhs:Float):Float {
    	var t:Int = cast this;
    	var r:Int = cast rhs;
    	return t * r;
    }
    // A/B
    @:op(A/B)
    public inline function div(rhs:Int):Int {
    	return Math.round(cast(this,Int) / rhs);
    }
    @:op(A/B)
    public inline function divF(rhs:Float):Float {
    	var f:Float = cast this;
    	return f / rhs;
    }
    // A-B
    @:op(A-B)
    public inline function sub(rhs:Int) {
    	var t:Int = cast this;
    	return t - rhs;
    }
    @:op(A-B)
    public inline function subF(rhs:Float) {
    	var t:Float = cast this;
    	return t - rhs;
    }
    @:op(B-A)
    public inline function subF2(rhs:Float) {
    	var t:Float = cast this;
    	return rhs - t;
    }
    @:op(-A)
    public inline function neg():Int {
    	var t:Int = cast this;
    	return cast -t;
    }

    // Value getter
    public var value(get,never):T;
    public inline function get_value():T
    return this;
}

class Tools {
	// Short functional syntax support
	public static inline function const<T>(v:T)
	return new Const(v);
}
