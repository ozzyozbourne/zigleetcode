const std = @import("std");
const p = std.debug.print;

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

    const res:bool = is_palindrome("osaid", 0);
    const res_1:bool = is_palindrome("OohoO", 0);
    const res_2:bool = is_palindrome("AA", 0);
    std.debug.print("\nIs \"osaid\" a palindrome ? -> {}\n", .{res});
    std.debug.print("\nIs \"OohoO\" a palindrome ? -> {}\n", .{res_1});
    std.debug.print("\nIs \"AA\" a palindrome ? -> {}\n", .{res_2});

    p("\nFib 3, 4, 5 values are -> {} {} {}\n", .{fib(3), fib(4), fib(5)});
    p("\nFib 2 value are -> {}\n", .{fib(2)});
    p("\nIs \"abc\" a subsequence of \"ahbgdc\" -> {}\n", .{is_sequence("abc", "ahbgdc")});
    p("\nIs \"axe\" a subsequence of \"ahbgdc\" -> {}\n", .{is_sequence("axe", "ahbgdc")});

    var in = [_]isize{2,7,11,15};
    var result_1 = two_sum(in[0..in.len], 9);
    print_slice(result_1[0..result_1.len]); 

    p("\ntwo sum two\n", .{});
    var input_arr = [_]usize{2,7,11,15};
    var output_arr = two_sum_two(input_arr[0..input_arr.len], 9);
    print_slice(output_arr[0..output_arr.len]);
}

fn two_sum_two(nums: []usize, target: usize)[2]usize {
    var left:usize = 0;
    var right:usize = nums.len-1;
    while(left < right){
        const sum = nums[left] + nums[right];
        if(sum < target){left+=1;}
        else if (sum > target){right-=1;}
        else {
            left+=1;
            right+=1;
            break;
        }
    }
    return [_]usize{left, right};
}

fn two_sum(nums: [] isize, target: isize ) [2]usize {
    var map = std.AutoHashMap(isize, usize).init(std.heap.page_allocator);
    defer map.deinit();
    var res: [2]usize = undefined; 
    for (nums, 0..) |value, index| {
       if(map.contains(target - value)){
            res[0] = index;
            res[1] = map.get(target - value).?;
            break;
        }else map.put(value, index) catch unreachable;
    }return res;
}

fn is_sequence(a1: []const u8, a2: []const u8)bool {
    var l:usize = 0;
    var r:usize = 0;
    while(l < a1.len and r < a2.len):(r+=1){
        if (a1[l] == a2[r]) l+=1;
    }
    return l == a1.len;
}

fn fib(n:usize)usize{
    if(n==1 or n==0 ) return n;
    return fib(n-1)+fib(n-2);
}

fn is_palindrome(s:[]const u8, i:usize ) bool {
    if(i == s.len/2) return true;
    if(s[i] != s[s.len-1-i]) return false;
    return is_palindrome(s, i+1); 
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


fn print_slice_isize(arr: []const isize)void {
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

