
let pipe fs =
  let f a x y z = z a in let base b = b in List.fold_left f base fs;;
