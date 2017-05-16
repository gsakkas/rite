
let pipe fs =
  let f a x = x (x a) in let base y = y in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
