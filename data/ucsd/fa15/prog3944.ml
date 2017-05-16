
let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if h = (listReverse x)
      then matchHeads (getTail (listReverse t))
      else false;;
