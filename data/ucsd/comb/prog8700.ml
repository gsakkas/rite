
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let getHeads y = match listReverse (explode y) with | [] -> [] | h::t -> [h];;

let rec matchHeads x =
  match explode x with
  | h::t ->
      if (getHeads x) = []
      then (if h = (getHeads t) then true else false)
      else false;;
