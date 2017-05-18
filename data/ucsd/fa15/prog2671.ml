
let pipe fs =
  let f a x y c = a (x c) in let base y = y in List.fold_left f base fs;;
