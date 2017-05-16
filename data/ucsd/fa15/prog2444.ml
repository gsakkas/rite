
let pipe fs =
  let f a x y c = (x a) = x in let base g x = x in List.fold_left f base fs;;
