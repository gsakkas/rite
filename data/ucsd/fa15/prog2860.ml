
let pipe fs =
  let f a x y z = z y in let base x = x in List.fold_left f base fs;;
