
let pipe fs =
  let f a x = List.map x in let base = 0 in List.fold_left f base fs;;
