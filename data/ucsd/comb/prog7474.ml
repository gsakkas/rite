
let pipe fs =
  let f a x = let h::t = x in h a in
  let base = [] in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
