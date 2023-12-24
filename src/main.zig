// Since @import() returns a structure, we can access the specific things we need and pull them out.
const print = @import("std").debug.print;

// Note that we do not mark the return type with an error possibility (no !)
// Because there is
// - no try statements
// - no functions within that could possibly propagate an error (debug.print from std does not fail, its part of its implementation)
pub fn main() void {
    print("Hello, world!\n", .{});
}

// -- separator --

// @import will create a structure that contains the functions variables etcs of the "std" (standard) library.
// because it creates a structure, its necessary to save it into a variable, which we do with const std = ...;
// const obviously means constant, unchanging, and by doing all this we can then access functions and other things
// from the standard library via std.NAME_OF_THING
//
// In total: This is a immutable constant variable called std that imports an unnamed structure containing all of the standard library functions.
//const std = @import("std");

// pub fn means public function. main() is just the entrypoint, like most other languages
// !void has two separate meanings, its called an Error Union Type
// the above essentially means that it will either return an Error (defined by the !),
// OR, it will return a type void (meaning nothing, as most other languages have it too)
// The full form is supposed to be <errortype>!<rettype>, but here we don't explicitly state error type
// Zig will set its type to an inferred error set type (w/e that means)
//
// In total: This is a public function named main, with no parameters, and can return either an error, or nothing at all.
//pub fn main() !void {
// Grabs the standard output writer (unsure if this is a copy or a reference to the actual object).
// Save it into a constant called stdout
//const stdout = std.io.getStdOut().writer();
// "Tries" to run the print function within stdout, with arguments "Hello, {s}!\n", .{"world"} <-- string substitution
// These two arguments are evaluated at COMPILE-time
// The .{} is a tuple structure
// The "try" part will run the code, and if it returns an error (a function with !<rettype>),
// it'll return the function at that exact statement with the error
// e.g. if print() returned an error, it would stop code execution, and return the calling function main()
// with the error from stdout.print()
// Note: this all implies that in order to run a try, you NEED to mark your calling function return type with !
// There's probably other error handling that does not need to pass it back to the calling function, but idk those yet.
//
// In total: Try only applies to return types that are marked with !, it will run the code and if it returns an error, stops the function and returns that exact error
//try stdout.print("Hello, {s}!\n", .{"world"});
//}
