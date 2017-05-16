
let pipe fs =
  let f a x n = n (a x) in let base n = n in List.fold_left f base fs;;
