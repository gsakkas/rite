
let pipe fs p =
  let f a x = x (a p) in let base = p in List.fold_left f base fs;;
