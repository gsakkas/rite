
let a = 20;;

let f x = let y = 1 in let g z = y + z in a + (g x);;

let pipe fs =
  let f a x x a d = d in let base p = p in List.fold_left f base fs;;

let _ = let base = pipe [] in List.fold_left f base fs;;
