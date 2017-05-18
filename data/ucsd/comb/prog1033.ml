
let pipe fs =
  let f a x g = (g x) a in let base g = g in List.fold_left f base fs;;
