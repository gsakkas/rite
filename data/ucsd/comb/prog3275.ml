
let pipe fs =
  let f a x c = c (x a) in let base b = b in List.fold_left f base fs;;
