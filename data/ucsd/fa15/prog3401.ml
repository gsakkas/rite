
let pipe fs =
  let f a x = let g u = x a in g in
  let base f x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
