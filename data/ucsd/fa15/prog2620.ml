
let identity a = a;;

let pipe fs =
  let f a x b = x a in let base = identity in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
