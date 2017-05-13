
let pipe fs =
  let f a x k = x (k a) in let base y = y in List.fold_left f base fs;;
