
let pipe fs =
  let f a x = x a "to be implemented" in
  let base = 0 "to be implemented" in List.fold_left f base fs;;
