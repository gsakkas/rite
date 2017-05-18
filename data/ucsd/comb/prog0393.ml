
let pipe fs =
  let f a x = match x with | [] -> a | h::t -> h in
  let base x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
