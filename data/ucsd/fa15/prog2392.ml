
let pipe fs =
  let f a x x a = x x a in let base f x = x in List.fold_left f base fs;;
