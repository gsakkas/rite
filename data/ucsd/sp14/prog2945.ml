
let pipe fs =
  let f a x = function | g -> x a in
  let base = function | x -> x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
