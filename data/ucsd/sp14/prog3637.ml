
let pipe fs =
  let f a x = a x in let base x y = x y in List.fold_left f base fs;;
