
let rec fold_l f base xs =
  match xs with | [] -> base | h::t -> f (fold_l f base t) h;;

let list = ["hi"; "iris"; "elephant"];;

let sumListL = fold_l (fun temp  -> fun h  -> (h * h) + temp) "" list;;
