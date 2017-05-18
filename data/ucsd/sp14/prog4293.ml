
let pipe fs =
  let f a x x a = x a in let base p = p in List.fold_left f base fs;;

let pipe fs =
  let f a x x a = x a in let base = pipe [] in List.fold_left f base fs;;

let _ = pipe [] 3;;
