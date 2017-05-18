
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let palindrome w = (explode w) = (explode (listReverse w));;
