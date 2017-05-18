
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let cutTail z = match listReverse z with | [] -> [] | h::t -> t;;

let getHeads x = match listReverse x with | [] -> [] | h::t -> h;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads y =
  match y with
  | [] -> true
  | h::t -> if h = (getHeads t) then matchHeads (cutTail t) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;
