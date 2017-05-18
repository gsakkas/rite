
let pipe fs =
  let f a x x = x a in let base x1 = x1 in List.fold_left f base fs;;
