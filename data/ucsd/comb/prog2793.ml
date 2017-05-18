
let pipe fs =
  let f a x p' = a in let base a' = a' in List.fold_left f base fs;;
