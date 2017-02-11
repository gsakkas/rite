
let a = 20;;

let f x = let y = 1 in let g z = y + z in a + (g x);;

let pipe fs =
  let f a x = f x a in let base = f x a in List.fold_left f base fs;;
