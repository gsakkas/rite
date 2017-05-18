
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;
