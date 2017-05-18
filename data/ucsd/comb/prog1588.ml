
let pipe fs =
  let f a x = function | f' -> x (f' a) in
  let base = function | y -> y in List.fold_left f base fs;;
