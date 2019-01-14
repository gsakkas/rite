
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

let palindrome w = (explode w) = (listReverse explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(14,33)-(14,56)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

(14,46)-(14,53)
explode w
AppG (fromList [VarG])

*)
