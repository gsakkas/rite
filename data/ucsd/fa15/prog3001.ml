
let pipe fs =
  let f a x n x = a n in let base n = n in List.fold_left f base fs;;
