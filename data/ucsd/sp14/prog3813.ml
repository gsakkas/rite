
let pipe fs =
  let f a x x a d = d in let base p = p in List.fold_left f base fs;;

let _ = pipe [] 3;;
