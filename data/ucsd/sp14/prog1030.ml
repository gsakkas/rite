
let pipe fs =
  let f a x g = (a x) g in let base g = g in List.fold_left f base fs;;
