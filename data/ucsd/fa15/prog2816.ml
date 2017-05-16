
let pipe fs =
  let f a x t = t (x a) in let base z = z in List.fold_left f base fs;;
