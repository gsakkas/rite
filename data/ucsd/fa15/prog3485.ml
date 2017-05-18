
let pipe fs =
  let f a x = let x = x in x a in let base y = y in List.fold_left f base fs;;

let pipe fs =
  let f a x = x (pipe fs) in let base y = y in List.fold_left f base fs;;

let pipe fs =
  let f a x = x (pipe List.hd fs) in
  let base y = y in List.fold_left f base fs;;
