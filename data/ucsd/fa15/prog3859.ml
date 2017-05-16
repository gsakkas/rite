
let pipe fs =
  let f a x = function | [] -> x | h::fs' -> h x in
  let base = function | [] -> fs in List.fold_left f base fs;;
