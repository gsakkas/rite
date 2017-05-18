
let pipe fs =
  let f a x = List.map x in let base = 3 in List.fold_left f base fs;;
