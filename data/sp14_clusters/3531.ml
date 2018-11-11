
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec reverseHelper acc =
    function | [] -> acc | h::t -> reverseHelper (h :: acc) t in
  reverseHelper [] l;;

let palindrome w = if (explode w) = (listReverse w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec reverseHelper acc =
    function | [] -> acc | h::t -> reverseHelper (h :: acc) t in
  reverseHelper [] l;;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(12,49)-(12,50)
explode
VarG

(12,49)-(12,50)
explode w
AppG [VarG]

*)
