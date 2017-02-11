
let a = 20;;

let f x = let y = 1 in let g z = y + z in a + (g x);;

let _ = let base p = p in List.fold_left f base fs;;
