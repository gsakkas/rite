
let pipe fs =
  let f a x f x = f (x a) in let base z = z in List.fold_left f base fs;;
