
let pipe fs =
  let f a x = function | [] -> x | h::fs' -> h x in
  let base = [] in List.fold_left f base fs;;
