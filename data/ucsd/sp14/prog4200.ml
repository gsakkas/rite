
let pipe fs =
  let f a x = function | g -> a x in
  let base = function | x -> x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
