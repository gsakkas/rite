
let pipe fs =
  let f a x c y z = z (a c) in let base b = b in List.fold_left f base fs;;
