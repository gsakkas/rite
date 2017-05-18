
let pipe fs = let f a x a = x in let base a = a in List.fold_left f base fs;;

let pipe fs =
  let f a x a x = x in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x = pipe [] in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x a = x in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x = a x in let base = pipe [] in List.fold_left f base fs;;
