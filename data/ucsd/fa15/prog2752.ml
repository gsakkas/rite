
let pipe fs =
  let f a x = (x + x) + a in let base = [] in List.fold_left f base fs;;
