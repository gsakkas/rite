
let pipe fs =
  let f a x x' = x' = (x a) in let base x = x in List.fold_left f base fs;;

let _ = pipe [] 3;;
