
let pipe fs =
  let f a x result n = x (a n) in let base = 0 in List.fold_left f base fs;;
