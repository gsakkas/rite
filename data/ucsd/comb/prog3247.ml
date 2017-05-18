
let pipe fs =
  let f a x fn fn2 = a in let base b = b in List.fold_left f base fs;;
