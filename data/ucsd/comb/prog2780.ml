
let pipe fs =
  let f a x a = x (x a) in let base d = d in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x); (fun x  -> x ^ x)] 3;;
