
let pipe fs =
  let f a x = let an = a in x an in
  let base b = b in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
