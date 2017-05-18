
let pipe fs =
  let f a x = let a = x in a x in let base x = x in List.fold_left f base fs;;
