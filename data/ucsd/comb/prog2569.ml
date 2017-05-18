
let pipe fs =
  let f a x a a = a a in let base x = x in List.fold_left f base fs;;
