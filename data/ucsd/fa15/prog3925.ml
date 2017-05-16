
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec matchHeads (x,y) =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y) then matchHeads t (getTail y) else false;;
