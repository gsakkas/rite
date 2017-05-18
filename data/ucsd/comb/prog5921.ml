
let pipe fs =
  let f a x a x l = x (a l) in let base x = x in List.fold_left f base fs;;
