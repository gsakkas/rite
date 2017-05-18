
let pipe fs =
  let f a x = match x with | x::xs' -> x a in
  let base _ x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
