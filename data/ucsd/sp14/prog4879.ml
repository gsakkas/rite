
let pipe fs =
  let f a x = let y z xn = xn a in y in
  let base b = b in List.fold_left f base fs;;
