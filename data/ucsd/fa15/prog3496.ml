
let pipe fs =
  let f a x x y = x (a y) in let base m = m in List.fold_left f base fs;;
