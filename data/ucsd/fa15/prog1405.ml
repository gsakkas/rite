
let pipe fs =
  let f a x f' a x = x a in let base = 0 in List.fold_left f base fs;;
