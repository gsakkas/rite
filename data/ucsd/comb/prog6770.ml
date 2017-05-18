
let pipe fs =
  let f a x b x a = x a b in let base i = i in List.fold_left f base fs;;
