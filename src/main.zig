const std = @import("std");
const print = std.debug.print;

fn assignment() void {
    // A constant variable with type: pointer to a constant array of size 3, of type u8 (8-bit unsigned int or byte)
    // Note: Usually don't do this, I only did this to show the type explicitly
    const name: *const [3]u8 = "Ali";
    // infers type as unsigned 8-bit integer
    var age = @as(u8, 21);

    // type must be declared here. generally do not use value, or else its undefined behaviour.
    var single: bool = undefined;

    // pretend I did user input here or smthing
    single = false;

    // .{} is a tuple structure
    // {s} and {d} are like %s and %d format specifiers.
    print("My name is {s} and I am {d} years old.\n", .{ name, age });
    print("I am {s}.\n", .{if (!single) "happily taken" else "happily single"}); // if statements are expressions that evaluate to self (think LISP)
}

fn arrays() void {
    // [_] means determine size automatically, otherwise this case would be [5]
    // this is an array literal
    const fibb = [_]u3{ 1, 1, 2, 3, 5 }; // <- yes you can have any bit sized integer, with the max afaik being 65535
    // this allocates enough memory for 3 u16 integers, but its undefined, so we must set manually
    // this is essentially how to define an empty array of a size
    var arr: [3]u16 = undefined;

    arr[0] = 100;
    arr[1] = 200;
    arr[2] = 300;

    // print supports printing arrays, but we must specify the type in the {} for the array to print right
    // in other cases we don't NEED to specify the format specifier
    print("{d} {d}\n", .{ fibb, arr });
}

pub fn main() void {
    assignment();
    arrays();
}
