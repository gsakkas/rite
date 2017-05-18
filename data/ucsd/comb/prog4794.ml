
let pipe fs =
  let f a x f = f (a x) in let base x = x in List.fold_left f base fs;;
