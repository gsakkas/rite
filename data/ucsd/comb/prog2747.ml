
let pipe fs =
  let f a x x a = x a in let base p = p in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
