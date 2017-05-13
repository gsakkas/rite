
let pipe fs =
  let f a x y = a (y x) in let base b = b in List.fold_left f base fs;;
