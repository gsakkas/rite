
let pipe fs =
  let f a x k = a x k in let base y = y in List.fold_left f base fs;;
