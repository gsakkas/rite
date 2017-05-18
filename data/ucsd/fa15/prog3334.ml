
let pipe fs =
  let f a x = List.fold_right a 0 x in
  let base = 0 in List.fold_left f base fs;;
