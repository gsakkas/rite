
let pipe fs = let f a x a = x in let base a = a in List.fold_left f base fs;;

let pipe fs =
  let f a x a x = x in let base = pipe [] in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
