
let pipe fs =
  let f a x result n = x (a n) in let base = f in List.fold_left f base fs;;

let _ = pipe [] 3;;
