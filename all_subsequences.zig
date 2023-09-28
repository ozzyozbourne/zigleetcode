const std = @import("std");
const allocator = std.testing.allocator;
var d2 = std.ArrayList(std.ArrayList(isize)).init(allocator);


pub fn main()void {
  
}


fn generate_all_subsequences(arr: [] const isize,  i: usize, d1: *std.ArrayList(isize)) !void {
    if(arr.len == i){
      try d2.append(try d1.clone());
      return;
    }
    try d1.append(arr[i]);
    try generate_all_subsequences(arr, i+1, d1);
    _= d1.pop();
    try generate_all_subsequences(arr, i+1, d1);
 
}

fn print_subsequences() void{
    for (d2.items) |i| {
      for (i.items) |j| {
        std.debug.print("{d} ", .{j});    
      }
      std.debug.print("\n", .{});
    }
}

test "Zig Memory check" {
    defer d2.deinit();

    var d1 = std.ArrayList(isize).init(allocator);
    defer d1.deinit();

    const v = [_] isize{1, 2, 3};
    try generate_all_subsequences(v[0..v.len], 0, &d1);
    print_subsequences();
   
    try std.testing.expect(d2.items.len == 8);
    for (d2.items) |item| {
        item.deinit();
    }
}
