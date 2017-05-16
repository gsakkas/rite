
let pipe fs =
  let f a x y x = x a in let base g x = x in List.fold_left f base fs;;
