const std = @import("std");
const p = std.debug.print;
const allocator = std.heap.page_allocator;

pub fn main() void {

    var map = std.AutoHashMap(u32, u32).init(allocator);
    defer map.deinit();

    map.put(1, 2) catch unreachable; 
    map.put(3, 4) catch unreachable; 
    
    var res = map.getOrPut(1) catch unreachable;
    if(res.found_existing){
       res.value_ptr.* = 20;
    }


    res = map.getOrPut(1) catch unreachable;
    if(res.found_existing){
       p("\nvalue -> {}\n", .{res.value_ptr.*});
    }else {
       p("\nnoo goo\n", .{});
    }

  var iterator = map.iterator();
   
    while(iterator.next()) |entry| {
        p("\n{}\t{}\n", .{entry.key_ptr.*, entry.value_ptr.*});
    }

}
