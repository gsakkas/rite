
let pipe fs = let f a x = x a in let base = 3 in List.fold_left f base fs;;

let pipe fs =
  let f a x = x a in let base = pipe fs y in List.fold_left f base fs;;
