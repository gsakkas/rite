
let pipe fs =
  let rec f a x = let h::t = x in h a in
  let base = [] in List.fold_left f base fs;;

let pipe fs =
  let f a x = let h::t = x in pipe t in
  let base = [] in List.fold_left f base fs;;

let _ = pipe [] 3;;
