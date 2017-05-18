
let pipe fs =
  let f a x = function | g -> x (g a) in
  let base = function | b -> b in List.fold_left f base fs;;
