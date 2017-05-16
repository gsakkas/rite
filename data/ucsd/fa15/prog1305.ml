
let pipe fs =
  let f a x combine c = x (a c) in let base x = x in List.fold_left f base fs;;
