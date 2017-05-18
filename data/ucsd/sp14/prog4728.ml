
let pipe fs =
  let f a x = a = (x a) in let base = 0 in List.fold_left f base fs;;
