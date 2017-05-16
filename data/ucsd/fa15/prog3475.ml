
let pipe fs =
  let f a x m n = m a in let base n = n in List.fold_left f base fs;;
