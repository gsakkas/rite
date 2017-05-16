
let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

let pipe fs =
  let f a x = pipe x in let base x = x in List.fold_left f base fs;;

let pipe fs =
  let f a x = pipe x in let base x = x in List.fold_left f base fs;;

let pipe fs =
  let f a x = pipe x in let base x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
