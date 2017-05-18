
let pipe fs =
  let f a x = match x with | [] -> a | h::t -> h a in
  let base = 0 in List.fold_left f base fs;;

let _ = pipe [] 3;;
