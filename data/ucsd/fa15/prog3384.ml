
let pipe fs =
  let f a x = let f1::f2::t = x in f2 (f1 a) in
  let base k = k in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
