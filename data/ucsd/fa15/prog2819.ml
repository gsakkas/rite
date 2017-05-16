
let pipe fs =
  let f a x p = p a x in let base z = z in List.fold_left f base fs;;
