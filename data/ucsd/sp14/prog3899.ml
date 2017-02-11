
let pipe fs =
  let f a x = function | g -> a (g x) in
  let base = function | x -> x in List.fold_left f base fs;;
