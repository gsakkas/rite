
let pipe fs =
  let f a x = List.map a x in let base x = x in List.fold_left f base fs;;
