
let pipe fs =
  let f a x a x = x a in let base d = d in List.fold_left f base fs;;
