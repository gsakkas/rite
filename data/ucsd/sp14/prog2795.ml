
let pipe fs =
  let f a x p' = x a in let base a' = a' in List.fold_left f base fs;;

let pipe fs =
  let f a x p' = x a in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x p' = x a in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x p' = x a in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x p' = x a in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x p' = x a in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x = x a in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x p = a x in let base = pipe [] in List.fold_left f base fs;;

let pipe fs =
  let f a x p = x a in let base = pipe [] in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 4)] 3;;
