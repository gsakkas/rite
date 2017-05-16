
let pipe fs =
  let f a x k = x a k in let base x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
