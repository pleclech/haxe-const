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
    @:commutative
    public static inline function addI(lhs:Const<Int>, rhs:Int) {
    	return lhs.value + rhs;
    }
    @:op(A+B)
    @:commutative
    public static inline function addF(lhs:Const<Float>, rhs:Float) {
    	return lhs.value + rhs;
    }
    // A*B
    @:op(A*B)
    @:commutative
    public static inline function mulI(lhs:Const<Int>, rhs:Int) {
    	return lhs.value * rhs;
    }
    @:op(A*B)
    @:commutative
    public static inline function mulF(lhs:Const<Float>, rhs:Float) {
    	return lhs.value * rhs;
    }
    // A/B
    @:op(A/B)
    public static inline function divCI(lhs:Const<Int>, rhs:Int) {
    	return Math.round(lhs.value / rhs);
    }
    @:op(A/B)
    public static inline function divIC(lhs:Int, rhs:Const<Int>) {
    	return Math.round(lhs / rhs.value);
    }
    @:op(A/B)
    public static inline function divCF(lhs:Const<Float>, rhs:Float) {
    	return lhs.value / rhs;
    }
    @:op(A/B)
    public static inline function divFC(lhs:Float, rhs:Const<Float>) {
    	return lhs / rhs.value;
    }
    // A-B
    @:op(A-B)
    public static inline function subCI(lhs:Const<Int>, rhs:Int) {
    	return lhs.value - rhs;
    }
    @:op(A-B)
    public static inline function subIC(lhs:Int, rhs:Const<Int>) {
    	return lhs - rhs.value;
    }
    @:op(A-B)
    public static inline function subCF(lhs:Const<Float>, rhs:Float) {
    	return lhs.value - rhs;
    }
    @:op(A-B)
    public static inline function subFC(lhs:Float, rhs:Const<Float>) {
    	return lhs - rhs.value;
    }
    @:op(-A)
    public static inline function negI(that:Const<Int>) {
    	return -that.value;
    }
    @:op(-A)
    public static inline function negF(that:Const<Float>) {
    	return -that.value;
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
