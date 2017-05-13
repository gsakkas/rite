
let rec removeZero l =
  match l with
  | [] -> 0
  | x::l' -> if x = 0 then List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l;;
