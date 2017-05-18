
let pipe fs =
  let f a x = List.fold_right a [] x in
  let base = [] in List.fold_left f base fs;;
