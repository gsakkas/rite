
let pipe fs =
  let f a x g = (x a) g in let base g = g in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
