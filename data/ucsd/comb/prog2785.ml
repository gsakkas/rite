
let f x = 1;;

let f x = if x < 2 then 1 else x * (f (x - 1));;

let _ =
  let pipe fs = let f a x = x in fun x  -> x in
  let base p = p in List.fold_left f base (List.rev fs);;
