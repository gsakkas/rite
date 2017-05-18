
let pipe fs =
  let f a x = let y = a in x y in let base b = b in List.fold_left f base fs;;

let pipe fs =
  let f a x = let y = pipe x a in x y in
  let base b = b in List.fold_left f base fs;;
