
let pipe fs =
  let f a x = function | g -> g a x in
  let base = function | x -> x in List.fold_left f base fs;;
