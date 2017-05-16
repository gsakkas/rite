
let pipe fs =
  let f a x a x = x a in let base b = b in List.fold_left f base fs;;
