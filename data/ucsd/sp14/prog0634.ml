
let pipe fs =
  let f a x = x (a x) in let base y = y in List.fold_left f base fs;;
