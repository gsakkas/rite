
let pipe fs =
  let f a x n = n (a x) in let base = 0 in List.fold_left f base fs;;
