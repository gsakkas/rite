
let pipe fs =
  let f a x y c = x (a c) in let base y = y in List.fold_left f base fs;;
