
let pipe fs =
  let f a x result x = a x in let base = 1 in List.fold_left f base fs;;
