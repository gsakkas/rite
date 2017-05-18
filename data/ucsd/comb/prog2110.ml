
let pipe fs =
  let f a x = x a in let base a = fs a in List.fold_left f base fs;;
