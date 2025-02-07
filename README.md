# hazel.nut

hazel.nut is small Squirrel script for automated TDD style unit testing inspired by the Chai.js API.

## Usage

Written in Squirrel 3.1 stable.

```squirrel
::dofile("hazel.nut");
hazel.describe("Major Test Area", function() {
	test("Minor Test One" function() {
		hazel.equals(5, 5);
	});
	test("Minor Test Two" function() {
		hazel.equals(5, 4);
	});
});
hazel.results();

// output:
// Major Test Area
// 	[ ] Minor Test One
// 	[x] Minor Test Two
// 		- Failed to assert that 5 == 4
```

## Function Reference

#### hazel.throws(fn [, message])
- @param { Function } fn
- @param { String } message

```squirrel
azel.throws(function() { throw "error"; });
```

#### hazel.does_not_throw(fn [, message])
- @param { Function } fn
- @param { String } message

```squirrel
hazel.does_not_throw(function() {});
```

#### hazel.equals(result, expected [, message])
- @param { Mixed } result
- @param { Mixed } expected
- @param { String } message

```squirrel
hazel.equals(5, 5);
```

#### hazel.not_equals(result, expected [, message])
- @param { Mixed } result
- @param { Mixed } expected
- @param { String } message

```squirrel
hazel.not_equals(3, 4);
```

#### hazel.greater_than(a, b [, message])
- @param { Mixed } a
- @param { Mixed } b
- @param { String } message

```squirrel
hazel.greater_than(5, 4);
```

#### hazel.less_than(a, b [, message])
- @param { Mixed } a
- @param { Mixed } b
- @param { String } message

```squirrel
hazel.less_than(4, 5);
```

#### hazel.at_most(a, b [, message])
- @param { Mixed } a
- @param { Mixed } b
- @param { String } message

```squirrel
hazel.at_most(5, 5);
hazel.at_most(4, 5);
```

#### hazel.at_least(a, b [, message])
- @param { Mixed } a
- @param { Mixed } b
- @param { String } message

```squirrel
hazel.at_least(5, 5);
hazel.at_least(5, 4);
```

#### hazel.between(value, a, b [, inclusive, message])
- @param { Mixed } a
- @param { Mixed } b
- @param { Boolean } [inclusive=false]
- @param { String } message

```squirrel
hazel.between(5, 0, 10);
hazel.between(5, -10, 10);
hazel.between(5, 5, 5, true);
```

#### hazel.length_of(target, length [, message])
- @param { Mixed } target
- @param { Integer } length
- @param { String } message

Determined by `len()` method.

```squirrel
hazel.length_of([1, 2, 3], 3);
hazel.length_of("foobar", 6);
```

#### hazel.is_empty(target [, message])
- @param { Mixed } target
- @param { String } message

Determined by `len()` method.

```squirrel
hazel.is_empty({});
hazel.is_empty([]);
hazel.is_empty("");
```

#### hazel.is_not_empty(target [, message])
- @param { Mixed } target
- @param { String } message

Determined by `len()` method.

```squirrel
hazel.is_not_empty([1, 2, 3]);
hazel.is_not_empty("foobar");
hazel.is_not_empty([null]);
```

#### hazel.is_true(value, [, message])
- @param { Boolean } value
- @param { String } message

```squirrel
hazel.is_true(true);
hazel.is_true(1);
```

#### hazel.is_false(value, [, message])
- @param { Boolean } value
- @param { String } message

```squirrel
hazel.is_false(false);
hazel.is_false(0);
```

#### hazel.is_typeof(value, name [, message])
- @param { Mixed } value
- @param { String } message
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
local Acorn = class {
	constructor() {}
	function _typeof() { return "acorn" }
};

hazel.is_typeof(Acorn(), "acorn");
```

#### hazel.is_not_typeof(value, name [, message])
- @param { Mixed } value
- @param { String } message
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_typeof(0x0012, "string");
```

#### hazel.is_integer(value [, message])
- @param { Integer } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_integer(123);
hazel.is_integer(0x0012);
hazel.is_integer(075);
hazel.is_integer('w');
```

#### hazel.is_not_integer(value [, message])
- @param { Integer } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_integer("2 acorns");
```

#### hazel.is_float(value [, message])
- @param { Float } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_float(1.0);
hazel.is_float(0.234);
```

#### hazel.is_not_float(value [, message])
- @param { Float } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_float(0x0012);
```

#### hazel.is_string(value [, message])
- @param { String } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_string("I'm a wonderful string\n");
hazel.is_string(@"I'm a verbatim string\n");
hazel.is_string(@"
	this is a multiline string
	it will ""embed"" all the new line
	characters
	");
```

#### hazel.is_not_string(value [, message])
- @param { String } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_string('w');
```

#### hazel.is_null(value [, message])
- @param { Mixed } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_null(null);
```

#### hazel.is_not_null(value [, message])
- @param { Mixed } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_null({});
hazel.is_not_null([]);
hazel.is_not_null([null]);
```

#### hazel.is_bool(value [, message])
- @param { Boolean } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_bool(false);
hazel.is_bool(true);
```

#### hazel.is_not_bool(value [, message])
- @param { Boolean } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_bool(0);
hazel.is_not_bool(1);
```

#### hazel.is_table(value [, message])
- @param { Table } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_table({});
hazel.is_table({ a = 10, b = function(a) { return a+1; }});
```

#### hazel.is_not_table(value [, message])
- @param { Table } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_table([]);
hazel.is_not_table([null]);
```

#### hazel.is_array(value [, message])
- @param { Array } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_array([]);
hazel.is_array([null]);
hazel.is_array([1, 2, 3]);
```

#### hazel.is_not_array(value [, message])
- @param { Array } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_array({});
```

#### hazel.is_function(value [, message])
- @param { Function } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_function(function() {});
```

#### hazel.is_not_function(value [, message])
- @param { Function } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
class Foo{ constructor() {} };
hazel.is_not_function(Foo);
```

#### hazel.is_class(value [, message])
- @param { Class } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
class Foo{ constructor() {} };
hazel.is_class(Foo);
```

#### hazel.is_not_class(value [, message])
- @param { Class } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
hazel.is_not_class([]);
hazel.is_not_class({});
```

#### hazel.is_instance(value [, message])
- @param { Instance } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
class Foo{ constructor() {} };
hazel.is_instance(Foo());
```

#### hazel.is_not_instance(value [, message])
- @param { Instance } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
class Foo{ constructor() {} };
hazel.is_not_instance(Foo);
```

#### hazel.is_instance_of(value, class [, message])
- @param { Instance } value
- @param { Class } class
- @param { String } message

```squirrel
local f = Foo();
hazel.is_instance_of(f, Foo);
```

#### hazel.is_not_instance_of(value, class [, message])
- @param { Instance } value
- @param { Class } class
- @param { String } message

```squirrel
local f = Foo();
hazel.is_instance_of(f, Bar);
```

#### hazel.is_generator(value [, message])
- @param { Generator } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
function gen(n) {
	for(local i = 1; i <= n; i++) yield i;
	return null;
}

hazel.is_generator(gen(10));
```

#### hazel.is_not_generator(value [, message])
- @param { Generator } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
function gen(n) {
	for(local i = 1; i <= n; i++) yield i;
	return null;
}

hazel.is_not_generator(gen);
```

#### hazel.is_userdata(value [, message])
- @param { Userdata } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
local a = CFunction();
hazel.is_userdata(a);
```

#### hazel.is_not_userdata(value [, message])
- @param { Userdata } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
```

#### hazel.is_thread(value [, message])
- @param { Thread } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
function coroutine() { return "I'm done"; }
local coro = ::newthread(coroutine);

hazel.is_thread(coro);
```

#### hazel.is_not_thread(value [, message])
- @param { Thread } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
function coroutine() { return "I'm done"; }
local coro = ::newthread(coroutine);

hazel.is_not_thread(coroutine);
```

#### hazel.is_weakref(value [, message])
- @param { Weakref } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
local a = [1, 2, 3];
local b = a.weakref();

hazel.is_weakref(b);
```

#### hazel.is_not_weakref(value [, message])
- @param { Weakref } value
- @param { String } message

Determined by `_typeof` metamethod.

```squirrel
local a = [1, 2, 3];
local c = a;

hazel.is_not_weakref(c);
```

## License

This library is free software; you can redistribute it and/or modify it under
the terms of the MIT license. See [LICENSE](LICENSE) for details.
