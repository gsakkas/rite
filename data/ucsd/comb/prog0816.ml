
let pipe fs =
  let f a x f x = f a in let base y = y in List.fold_left f base fs;;
