
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  if l = [] then [] else (let h::t = l in (listReverse t) @ [h]);;

let palindrome w =
  let wEx = explode w in
  let rec palHelper lst =
    if (List.length lst) < 2
    then []
    else
      if (List.tl lst) = (List.hd lst)
      then
        (let b::rest = lst in
         let b2::rest2 = listReverse rest in palHelper rest2)
      else [1] in
  if (List.length (palHelper wEx)) = 0 then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  if l = [] then [] else (let h::t = l in (listReverse t) @ [h]);;

let palindrome w =
  let wEx = explode w in
  let rec palHelper lst =
    if (List.length lst) < 2
    then []
    else
      if (List.tl lst) = lst
      then
        (let b::rest = lst in
         let b2::rest2 = listReverse rest in palHelper rest2)
      else [1] in
  if (List.length (palHelper wEx)) = 0 then true else false;;

*)

(* changed spans
(16,25)-(16,38)
(16,26)-(16,33)
*)

(* type error slice
(16,9)-(16,22)
(16,9)-(16,38)
(16,9)-(16,38)
(16,10)-(16,17)
(16,18)-(16,21)
(16,25)-(16,38)
(16,26)-(16,33)
(16,34)-(16,37)
*)
