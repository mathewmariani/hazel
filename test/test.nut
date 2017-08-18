::dofile("../hazel.nut");

hazel.describe("hazel.nut", function() {

	hazel.describe("hazel.throws", function() {
		hazel.test("should throw error", function() {
			hazel.throws(function() { throw "error"; });
		});
	});

	hazel.describe("hazel.does_not_throw", function() {
		hazel.test("should not throw error", function() {
			hazel.does_not_throw(function() {});
		});
	});

	hazel.describe("hazel.equals", function() {
		hazel.test("should equal", function() {
			hazel.equals(5, 5);
			hazel.equals(5.2, 5.2);
			hazel.equals(-5, -5);
			hazel.equals("string", "string");

			local arr = [1, 2];
			hazel.equals(arr, arr);
		});
		hazel.test("should not equal", function() {
			hazel.throws(function() { hazel.equals(4, 5); });
			hazel.throws(function() { hazel.equals(-5, 5); });
			hazel.throws(function() { hazel.equals(-5.2, 5.2); });
			hazel.throws(function() { hazel.equals([1, 2], [1, 2]); });
			hazel.throws(function() { hazel.equals({ a = 1 }, { a = 2 }); });
		});
	});

	hazel.describe("hazel.not_equals", function() {
		hazel.test("should not equal", function() {
		});
		hazel.test("should be equal", function() {
		});
	});

	hazel.describe("hazel.greater_than", function() {
		hazel.test("should be greater than", function() {
			hazel.greater_than(5, 4);
			hazel.greater_than(5, -5);
			hazel.greater_than(5.2, 4.2);
			hazel.greater_than(5.11, 5.1);
		});
		hazel.test("should not be greater than", function() {
			hazel.throws(function() { hazel.greater_than(4, 5); });
			hazel.throws(function() {	hazel.greater_than(-5, 5); });
			hazel.throws(function() {	hazel.greater_than(4.2, 6.2); });
			hazel.throws(function() {	hazel.greater_than(5.1, 5.11); });
		});
	});

	hazel.describe("hazel.less_than", function() {
		hazel.test("should be less than", function() {
			hazel.less_than(4, 5);
			hazel.less_than(-5, 5);
			hazel.less_than(4.2, 5.2);
			hazel.less_than(5.1, 5.11);
		});
		hazel.test("should not be less than", function() {
			hazel.throws(function() { hazel.less_than(5, 4); });
			hazel.throws(function() { hazel.less_than(5, -5); });
			hazel.throws(function() { hazel.less_than(5.2, 4.2); });
			hazel.throws(function() { hazel.less_than(5.11, 5.1); });
		});
	});

	hazel.describe("hazel.at_most", function() {
		hazel.test("should be at most", function() {
			hazel.at_most(5, 5);
			hazel.at_most(4, 5);
			hazel.at_most(-5, 5);
			hazel.at_most(5, 5.0);
			hazel.at_most(4.2, 5.2);
			hazel.at_most(5.1, 5.11);
		});
		hazel.test("should not be at most", function() {
			hazel.throws(function() { hazel.at_most(6, 5); });
			hazel.throws(function() { hazel.at_most(5, -5); });
		});
	});

	hazel.describe("hazel.at_least", function() {
		hazel.test("should be at least", function() {
			hazel.at_least(5, 5);
			hazel.at_least(5, 4);
			hazel.at_least(5, -5);
			hazel.at_least(5.0, 5);
			hazel.at_least(5.2, 4.2);
			hazel.at_least(5.11, 5.1);
		});
		hazel.test("should not be at least", function() {
			hazel.throws(function() { hazel.at_least(5, 6); });
			hazel.throws(function() { hazel.at_least(-5, 5); });
		});
	});

	hazel.describe("hazel.between", function() {
		hazel.test("should be hazel.between (exclusive)", function() {
			hazel.between(5, 0, 10);
			hazel.between(5, -10, 10);
			hazel.between(-5, -10, 0);
			hazel.between(5, 4.9, 5.1);
		});
		hazel.test("should not be hazel.between (exclusive)", function() {
			hazel.throws(function() { hazel.between(5, 5, 5); });
			hazel.throws(function() { hazel.between(11, 0, 10); });
			hazel.throws(function() { hazel.between(-1, 0, 10); });
			hazel.throws(function() { hazel.between(1, 0, -10); });
			hazel.throws(function() { hazel.between(-11, 0, -10); });
		});

		hazel.test("should be hazel.between (inclusive)", function() {
			hazel.between(5, -10, 10, true);
			hazel.between(5, 0, 10, true);
			hazel.between(-5, -10, 0, true);
			hazel.between(5, 4.9, 5.1, true);
			hazel.between(5, 5, 5, true);
		});
		hazel.test("should be hazel.between (inclusive)", function() {
			hazel.throws(function() { hazel.between(11, 0, 10, true); });
			hazel.throws(function() { hazel.between(-1, 0, 10, true); });
			hazel.throws(function() { hazel.between(1, 0, -10, true); });
			hazel.throws(function() { hazel.between(-11, 0, -10, true); });
		});
	});

	hazel.describe("hazel.length_of", function() {
		hazel.test("should be length of", function() {
			hazel.length_of([1, 2, 3], 3);
			hazel.length_of("foobar", 6);
		});
		hazel.test("should not be length of", function() {
			hazel.throws(function() { hazel.length_of([1, 2, 3], 5); });
			hazel.throws(function() { hazel.length_of("foobar", 5); });
			hazel.throws(function() { hazel.length_of(function() {}, 5); });
		});
	});

	hazel.describe("hazel.is_(not_)empty", function() {
		hazel.test("should be empty", function() {
			hazel.is_empty({});
			hazel.is_empty([]);
			hazel.is_empty("");
		});
		hazel.test("should not be empty", function() {
			hazel.is_not_empty([1, 2, 3]);
			hazel.is_not_empty("foobar");
			hazel.is_not_empty([null]);
		});
	});

	hazel.describe("hazel.is_true", function() {
		hazel.test("should be true", function() {
			hazel.is_true(true);
			hazel.is_true(1);
		});
		hazel.test("should not be true", function() {
			hazel.throws(function() { hazel.is_true(false); });
			hazel.throws(function() { hazel.is_true(0); });
		});
	});

	hazel.describe("hazel.is_false", function() {
		hazel.test("should be false", function() {
			hazel.is_false(false);
			hazel.is_false(0);
		});
		hazel.test("should not be false", function() {
			hazel.throws(function() { hazel.is_false(true); });
			hazel.throws(function() { hazel.is_false(1); });
		});
	});

	hazel.describe("hazel.is_(not_)typeof", function() {

		local Foo = class {
			constructor() {}
			function _typeof() { return "foo" }
		};

		hazel.test("should be typeof", function() {
			hazel.is_typeof(Foo(), "foo");
			hazel.is_typeof(0x0012, "integer");
			hazel.is_typeof(0.0012, "float");
		});
		hazel.test("should not be typeof", function() {
			hazel.is_not_typeof(Foo(), "bar");
		});

	});

	hazel.describe("hazel.is_(not_)integer", function() {
		hazel.test("should be integer", function() {
			hazel.is_integer(123);
			hazel.is_integer(0x0012);
			hazel.is_integer(075);
			hazel.is_integer('w');
		});
		hazel.test("should not be integer", function() {
			hazel.is_not_integer(1.0);
			hazel.is_not_integer(0.234);
			hazel.is_not_integer("2 acorns");
			hazel.is_not_integer(false);
		});
	});

	hazel.describe("hazel.is_(not_)float", function() {
		hazel.test("should be float", function() {
			hazel.is_float(1.0);
			hazel.is_float(0.234);
		});
		hazel.test("should not be float", function() {
			hazel.is_not_float(123);
			hazel.is_not_float(0x0012);
			hazel.is_not_float(075);
			hazel.is_not_float('w');
		});
	});

	hazel.describe("hazel.is_string", function() {
		hazel.test("should be string", function() {
			hazel.is_string("I'm a wonderful string\n");
			hazel.is_string(@"I'm a verbatim string\n");
			hazel.is_string(@"
				this is a multiline string
				it will ""embed"" all the new line
				characters
				");
		});
		hazel.test("should not be string", function() {
			hazel.is_not_string(123);
			hazel.is_not_string(0x0012);
			hazel.is_not_string(075);
			hazel.is_not_string('w');
		});
	});

	hazel.describe("hazel.is_(not_)null", function() {
		hazel.test("should be null", function() {
			hazel.is_null(null);

			local var;
			hazel.is_null(var);
		});
		hazel.test("should not be null", function() {
			hazel.is_not_null('w');
			hazel.is_not_null({});
			hazel.is_not_null([]);
			hazel.is_not_null([null]);
		});
	});

	hazel.describe("hazel.is_bool", function() {
		hazel.test("should be bool", function() {
			hazel.is_bool(false);
			hazel.is_bool(true);
		});
		hazel.test("should not be bool", function() {
			hazel.is_not_bool(0);
			hazel.is_not_bool(1);
		});
	});

	hazel.describe("hazel.is_table", function() {
		hazel.test("should be table", function() {
			hazel.is_table({});
			hazel.is_table({ a = 10, b = function(a) { return a+1; }});
		});
		hazel.test("should not be table", function() {
			hazel.is_not_table([]);
			hazel.is_not_table([null]);
		});
	});

	hazel.describe("hazel.is_(not_)array", function() {
		hazel.test("should be array", function() {
			hazel.is_array([]);
			hazel.is_array([null]);
			hazel.is_array([1, 2, 3]);
		});
		hazel.test("should not be array", function() {
			hazel.is_not_array({});
		});
	});

	hazel.describe("hazel.is_(not_)function", function() {
		class Foo{ constructor() {} };
		hazel.test("should be function", function() {
			hazel.is_function(function() {});
		});
		hazel.test("should not be function", function() {
			hazel.is_not_function(Foo());
		});
	});

	hazel.describe("hazel.is_(not_)class", function() {

		class Foo{ constructor() {} };

		hazel.test("should be class", function() {
			hazel.is_class(Foo);
		});
		hazel.test("should not be class", function() {
			hazel.is_not_class(Foo());
			hazel.is_not_class([]);
			hazel.is_not_class({});
		});
	});

	hazel.describe("hazel.is_(not_)instance", function() {

		class Foo{ constructor() {} };

		hazel.test("should be instance", function() {
			hazel.is_instance(Foo());
		});
		hazel.test("should not be instance", function() {
			hazel.is_not_instance(Foo);
			hazel.is_not_instance([]);
			hazel.is_not_instance({});
		});
	});

	hazel.describe("hazel.is_(not_)instance_of", function() {

		class Foo{ constructor() {} }
		class Bar{ constructor() {} }
		local f = Foo();

		hazel.test("should be instance of", function() {
			hazel.is_instance_of(f, Foo);
		});
		hazel.test("should not be instance of", function() {
			hazel.is_not_instance_of(f, Bar);
		});
	});

	hazel.describe("hazel.is_(not_)generator", function() {

		function gen(n) {
			for(local i=1;i<=n;i+=1) yield i;
			return null;
		}

		hazel.test("should be generator", function() {
			hazel.is_generator(gen(10));
		});
		hazel.test("should not be generator", function() {
			hazel.is_not_generator(gen);
		});
	});

	hazel.describe("hazel.is_userdata", function() {
		hazel.test("should be userdata", function() {
		});
		hazel.test("should not be userdata", function() {
		});
	});

	hazel.describe("hazel.is_(not_)thread", function() {

		function coroutine() {}
		local coro = ::newthread(coroutine);

		hazel.test("should be thread", function() {
			hazel.is_thread(coro);
		});
		hazel.test("should not be thread", function() {
			hazel.is_not_thread(coroutine);
		});
	});

	hazel.describe("hazel.is_(not_)weakref", function() {

		local a = [1, 2, 3];

		hazel.test("should be weakref", function() {
			local b = a.weakref();
			hazel.is_weakref(b);
		});
		hazel.test("should not be weakref", function() {
			local c = a;
			hazel.is_not_weakref(c);
		});
	});
});

hazel.results();
