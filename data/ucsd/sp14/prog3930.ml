
let pipe fs =
  let f a x c d = a x in let base b = b in List.fold_left f base fs;;
