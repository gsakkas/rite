
let pipe fs =
  let f a x = let a = x in a a in let base x = x in List.fold_left f base fs;;
