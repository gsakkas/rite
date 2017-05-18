
let pipe fs =
  let f a x a = x a in let base a = fs in List.fold_left f base fs;;
