
let pipe fs =
  let f a x result = a x in let base = f in List.fold_left f base fs;;

let _ = pipe [] 3;;
