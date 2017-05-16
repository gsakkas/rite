
let pipe fs =
  let f a x y = a x y in let base x' = x' in List.fold_left f base fs;;
