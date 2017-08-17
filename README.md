# hazel.nut

hazel.nut is small Squirrel script for automated TDD style unit testing inspired by the Chai.js API.

## Usage

Written in Squirrel 3.1 stable.

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

#### hazel.between(value, a, b [, message])
- @param { Mixed } a
- @param { Mixed } b
- @param { String } message

```squirrel
hazel.between(5, 0, 10);
hazel.between(5, -10, 10);
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

#### hazel.is_integer(value [, message])
- @param { Integer } value
- @param { String } message

```squirrel
hazel.is_integer(123);
hazel.is_integer(0x0012);
hazel.is_integer(075);
hazel.is_integer('w');
```

#### hazel.is_float(value [, message])
- @param { Float } value
- @param { String } message

```squirrel
hazel.is_float(1.0);
hazel.is_float(0.234);
```

#### hazel.is_string(value [, message])
- @param { String } value
- @param { String } message

```squirrel
hazel.is_string("I'm a wonderful string\n");
hazel.is_string(@"I'm a verbatim string\n");
hazel.is_string(@"
	this is a multiline string
	it will ""embed"" all the new line
	characters
	");
```

#### hazel.is_null(value [, message])
- @param { Mixed } value
- @param { String } message

```squirrel
hazel.is_null(null);
```

#### hazel.is_bool(value [, message])
- @param { Boolean } value
- @param { String } message

```squirrel
hazel.is_bool(false);
hazel.is_bool(true);
```

#### hazel.is_table(value [, message])
- @param { Table } value
- @param { String } message

```squirrel
hazel.is_table({});
hazel.is_table({ a = 10, b = function(a) { return a+1; }});
```

#### hazel.is_array(value [, message])
- @param { Array } value
- @param { String } message

```squirrel
hazel.is_array([]);
hazel.is_array([null]);
hazel.is_array([1, 2, 3]);
```

#### hazel.is_function(value [, message])
- @param { Function } value
- @param { String } message

```squirrel
hazel.is_function(function() {});
```

#### hazel.is_class(value [, message])
- @param { Class } value
- @param { String } message

```squirrel
class Foo{ constructor() {} };
hazel.is_class(Foo);
```

#### hazel.is_instance(value [, message])
- @param { Instance } value
- @param { String } message

```squirrel
class Foo{ constructor() {} };
hazel.is_instance(Foo());
```

#### hazel.is_generator(value [, message])
- @param { Generator } value
- @param { String } message

```squirrel
function gen(n) {
	for(local i = 1; i <= n; i++) yield i;
	return null;
}

hazel.is_generator(gen);
```

#### hazel.is_userdata(value [, message])
- @param { Userdata } value
- @param { String } message

```squirrel
local a = CFunction();
hazel.is_userdata(a);
```

#### hazel.is_thread(value [, message])
- @param { Thread } value
- @param { String } message

```squirrel
function coroutine() { return "I'm done"; }
local coro = ::newthread(coroutine);

hazel.is_thread(coro);
```

#### hazel.is_weakref(value [, message])
- @param { Weakref } value
- @param { String } message

```squirrel
local a = [1, 2, 3];
local b = a.weakref();

hazel.is_weakref(b);
```

## License

This library is free software; you can redistribute it and/or modify it under
the terms of the MIT license. See [LICENSE](LICENSE) for details.
