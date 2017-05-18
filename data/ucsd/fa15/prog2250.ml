
let pipe fs =
  let f a x c x = a x in let base g x = x in List.fold_left f base fs;;
