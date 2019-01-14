
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
      if w == reversed then true else false;;


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
(16,9)-(16,10)
separated
VarG

*)
