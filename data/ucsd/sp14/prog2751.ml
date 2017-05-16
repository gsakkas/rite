
let f x = 1;;

let f x = if x < 2 then 1 else x * (f (x - 1));;

let pipe fs =
  let f a x x a d = d in let base p = p in List.fold_left f base fs;;

let _ = let base = pipe [] in List.fold_left f base fs;;
