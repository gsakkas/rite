
let pipe fs =
  let f a x c = x (c a) in let base b = b in List.fold_left f base fs;;
