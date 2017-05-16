
let pipe fs =
  let f a x fn x a = fn in let base b = b in List.fold_left f base fs;;
