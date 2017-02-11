
let pipe fs =
  let f a x = function | g -> x a g in
  let base = function | b -> b in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
