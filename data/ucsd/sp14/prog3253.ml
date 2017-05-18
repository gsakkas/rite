
let pipe fs =
  let f a x f = a (f x) in let base x = x in List.fold_left f base fs;;
