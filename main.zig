const std = @import("std");

pub fn main() void {
    print_name("ozzy", 10);
    print_linearly_from_1_n(10);
    print_linearly_from_N_1(10);
    std.debug.print("{d}\n", .{fact_tail_op(4)});
    std.debug.print("{d}\n", .{fact_non_tail_op(4)});
    var arr = [_]usize{1,2,3,4,5,6,7,8,9};
    std.debug.print("before -> \n", .{});
    print_slice(arr[0..arr.len]);
    reverse_an_array(arr[0..arr.len]);
    std.debug.print("\n\nAfter -> \n", .{});
    print_slice(arr[0..arr.len]);

    var arr_2 = [_]usize{1,2,3,4,5,6,7,8,9};
    std.debug.print("\nbefore -> \n", .{});
    print_slice(arr_2[0..arr_2.len]);
    reverse_recursive(arr_2[0..arr_2.len], 0);
    std.debug.print("\n\nAfter -> \n", .{});
    print_slice(arr_2[0..arr_2.len]);

    var arr_3 = [_]usize{1,2,3,4,5,6,7,8};
    std.debug.print("\nbefore -> \n", .{});
    print_slice(arr_3[0..arr_3.len]);
    reverse_recursive(arr_3[0..arr_3.len], 0);
    std.debug.print("\n\nAfter -> \n", .{});
    print_slice(arr_3[0..arr_3.len]);

}

fn reverse_an_array(arr: [] usize)void { 
    var left:usize  = 0;
    while (left < arr.len-1-left): (left += 1) {
        const temp:usize  = arr[left];
        arr[left] = arr[arr.len-1-left];
        arr[arr.len-1-left] = temp;     
    }
}

fn reverse_recursive(arr:[]usize, i:usize) void {
    if(i >= arr.len-1-i)return;
    const temp:usize = arr[i];
    arr[i] = arr[arr.len-1-i];
    arr[arr.len-1-i] = temp;
    reverse_recursive(arr, i+1);
}

fn print_slice(arr: []const usize)void {
    for (arr, 0..) |value, index| {
        std.debug.print("value -> {d}\tindex -> {d}\n", .{value, index});
    }
}

pub fn print_name(name: []const u8, number: u32) void {
   if (number == 0) return;
   std.debug.print("{s}\n", .{name});    
   print_name(name, number-1);
}

pub fn print_linearly_from_1_n(current_n: u32) void {
    if(current_n == 0)return;
    print_linearly_from_1_n(current_n - 1);
    std.debug.print("{d}\n", .{current_n});
}

pub fn print_linearly_from_N_1(number: u32) void {
    if(number == 0) return; 
    std.debug.print("{d}\n", .{number});
    print_linearly_from_N_1(number-1);
}

fn factorial(n: u32, sum: u32) u32 {
    if(n == 0) return sum;
    return factorial(n-1, sum*n);
}

pub fn fact_tail_op(n: u32) u32 {
    return factorial(n, 1);
}

pub fn fact_non_tail_op(n: u32) u32 {
    if(n == 1) return 1;
    return n * fact_non_tail_op(n-1);
}

