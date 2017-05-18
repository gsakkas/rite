
let pipe fs =
  let f a x c x = a a in let base g x = x in List.fold_left f base fs;;
