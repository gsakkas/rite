
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let loseTail z = match listReverse z with | [] -> [] | h::t -> t;;

let rec matchHeads x =
  match x with
  | h::t ->
      if (getHeads (explode x)) = []
      then true
      else if [h] = (getHeads t) then matchHeads (loseTail t) else false;;
