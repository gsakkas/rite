
let pipe fs =
  let f a x y z = z (fun r  -> y) in
  let base b = b in List.fold_left f base fs;;
