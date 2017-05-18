
let pipe fs =
  let f a x = function | g -> g x a in
  let base = function | x -> x in List.fold_left f base fs;;
