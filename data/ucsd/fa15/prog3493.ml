
let pipe fs =
  let f a x a y = a (x y) in let base m = m in List.fold_left f base fs;;

let _ = pipe [] 3;;
