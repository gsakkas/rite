
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  match w with
  | [] -> true
  | h::t ->
      let separated = explode w in
      let reversed = listReverse separated in
      if separated == reversed then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  let separated = explode w in
  let reversed = listReverse separated in
  if separated == reversed then true else false;;

*)

(* changed spans
(11,2)-(16,51)
(11,8)-(11,9)
(12,10)-(12,14)
(14,6)-(16,51)
(15,6)-(16,51)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(11,2)-(16,51)
(11,2)-(16,51)
(11,2)-(16,51)
(11,2)-(16,51)
(11,8)-(11,9)
(14,22)-(14,29)
(14,22)-(14,31)
(14,30)-(14,31)
*)
