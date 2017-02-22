(*F*)
let rec incr_list = function
  | [] -> []
  | x :: rem -> succ x :: incr_list rem
let f x = List.hd (incr_list [1;2;3]) = x
let _ = f "0"
