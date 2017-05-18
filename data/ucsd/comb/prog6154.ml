
let pipe fs =
  let f a x = (x fs) + a in let base = 0 in List.fold_left f base fs;;
