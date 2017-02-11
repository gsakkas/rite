
let pipe fs =
  let f a x f x f a = f a x in let base y z = z in List.fold_left f base fs;;
