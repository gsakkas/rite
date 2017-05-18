
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads y = match y with | [] -> [] | h::t -> t;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;
