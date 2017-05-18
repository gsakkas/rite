
let a = 20;;

let f x = let y = 1 in let g z = y + z in a + (g x);;

let pipe fs = let f a x = f a x in let base = 3 in List.fold_left f base fs;;
