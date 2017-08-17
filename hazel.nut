//
// hazel.nut
//
// This library is free software; you can redistribute it and/or modify it
// under the terms of the MIT license. See LICENSE for details.
//

local _stats = { pass = 0, fail = 0 };

local do_pass = function(desc) {
	_stats.pass = _stats.pass + 1;
	print(format("\t[ ] %s\n", desc));
}

local do_fail = function(desc, err) {
	_stats.fail = _stats.fail + 1;
	print(format("\t[x] %s\n", desc));
	print(format("\t\t- %s\n", err));
}

local do_test = function(fn) {
	try { fn(); } catch(err) { return err.tostring(); }
}

// hazel namespace
::hazel <- {
	describe = function(desc, fn) {
		print(format("%s\n", desc));
		fn();
		print("\n");
	},

	test = function(desc, fn) {
		local err = do_test(fn);

		if (!err) {
			do_pass(desc);
		} else {
			do_fail(desc, err);
		}
	},

	results = function() {
		print(format("\tpassed: %d\n\tfailed: %d\n\n", _stats.pass, _stats.fail));
	}

	reset = function() {
		_stats.pass = 0;
		_stats.fail = 0;
	},

	throws = function(fn, message = "Expected function to throw an error") {
		try { fn(); } catch(err) { return; } throw message;
	},

	does_not_throw = function(fn, message = "Expected function to not throw an error") {
		try { fn(); } catch(err) { throw message; }
	},

	equals = function(result, expected, message = "Failed to assert that %s == %s") {
		if (expected == result) return;
		throw format(message, expected.tostring(), result.tostring());
	},

	not_equals = function(result, expected, message = "Failed to assert that %s != %s") {
		if (expected != result) return;
		throw format(message, expected.tostring(), result.tostring());
	},

	greater_than = function(a, b, message = "Failed to assert that %s > %s") {
		if (a > b) return;
		throw format(message, a.tostring(), b.tostring());
	},

	less_than = function(a, b, message = "Failed to assert that %s < %s") {
		if (a < b) return;
		throw format(message, a.tostring(), b.tostring());
	},

	at_most = function(a, b, message = "Failed to assert that %s <= %s") {
		if (a <= b) return;
		throw format(message, a.tostring(), b.tostring());
	},

	at_least = function(a, b, message = "Failed to assert that %s >= %s") {
		if (a >= b) return;
		throw format(message, a.tostring(), b.tostring());
	},

	between = function(value, min, max, inclusive = false, message = "Expected value to be between %s..%s, got %s") {
		if (inclusive ? min <= value && value <= max : min < value && value < max) return;
		throw format(message, min.tostring(), max.tostring(), value.tostring());
	},

	is_true = function(value, message = "Failed to assert that %s is true") {
		if (value) return;
		throw format(message, value);
	},

	is_false = function(value, message = "Failed to assert that %s is false") {
		if (!value) return;
		throw format(message, value.tostring());
	},

	is_integer = function(value, message = "Failed to assert that %s is an integer") {
		if (typeof(value) == "integer") return;
		throw format(message, value.tostring());
	},

	is_float = function(value, message = "Failed to assert that %s is a float") {
		if (typeof(value) == "float") return;
		throw format(message, value.tostring());
	},

	is_string = function(value, message = "Failed to assert that %s is a string") {
		if (typeof(value) == "string") return;
		throw format(message, value.tostring());
	},

	is_null = function(value, message = "Failed to assert that %s is null") {
		if (typeof(value) == "null") return;
		throw format(message, value.tostring());
	},

	is_bool = function(value, message = "Failed to assert that %s is a bool") {
		if (typeof(value) == "bool") return;
		throw format(message, value.tostring());
	},

	is_table = function(value, message = "Failed to assert that %s is a table") {
		if (typeof(value) == "table") return;
		throw format(message, value.tostring());
	},

	is_array = function(value, message = "Failed to assert that %s is an array") {
		if (typeof(value) == "array") return;
		throw format(message, value.tostring());
	},

	is_function = function(value, message = "Failed to assert that %s is a function") {
		if (typeof(value) == "function") return;
		throw format(message, value.tostring());
	},

	is_class = function(value, message = "Failed to assert that %s is a class") {
		if (typeof(value) == "class") return;
		throw format(message, value.tostring());
	},

	is_instance = function(value, message = "Failed to assert that %s is an instance") {
		if (typeof(value) == "instance") return;
		throw format(message, value.tostring());
	},

	is_generator = function(value, message = "Failed to assert that %s is a generator") {
		if (typeof(value) == "generator") return;
		throw format(message, value.tostring());
	},

	is_userdata = function(value, message = "Failed to assert that %s is userdata") {
		if (typeof(value) == "userdata") return;
		throw format(message, value.tostring());
	},

	is_thread = function(value, message = "Failed to assert that %s is a thread") {
		if (typeof(value) == "thread") return;
		throw format(message, value.tostring());
	},

	is_weakref = function(value, message = "Failed to assert that %s is a weakref") {
		if (typeof(value) == "weakref") return;
		throw format(message, value.tostring());
	},
};
