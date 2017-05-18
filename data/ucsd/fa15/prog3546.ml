
let pipe fs =
  let f a x result n = x (a n) in
  let base result n = 0 in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
