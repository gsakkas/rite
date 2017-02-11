
let pipe fs =
  let f a x y = y a x in let base x = x in List.fold_left f base fs;;
