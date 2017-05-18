
let pipe fs =
  let f a x y = x (a y) in let base = fs in List.fold_left f base fs;;
