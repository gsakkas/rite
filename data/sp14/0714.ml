
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
      if (List.hd lst) = (List.tl lst)
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
(16,10)-(16,23)
List.tl lst
AppG [VarG]

(16,26)-(16,39)
lst
VarG

*)

(* type error slice
(16,10)-(16,23)
(16,10)-(16,39)
(16,11)-(16,18)
(16,19)-(16,22)
(16,26)-(16,39)
(16,27)-(16,34)
(16,35)-(16,38)
*)
