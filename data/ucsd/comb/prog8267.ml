
let pipe fs =
  let f a x x a = a x in let base n = n in List.fold_left f base fs;;
