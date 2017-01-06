
let rec assoc (d,k,l) =
  match d k l with
  | (d,k,l) ->
      if l = []
      then d
      else
        (match l with
         | hd::tl ->
             (match hd with | (a,b) -> if a = k then b else assoc (d, k, t)));;



let rec assoc (d,k,l) =
  if l = []
  then d
  else
    (match l with
     | h::t -> (match h with | (a,b) -> if a = k then b else assoc (d, k, t)));;


(* changed spans
(3,3)-(4,15)
(9,12)-(9,14)
(9,16)-(9,18)
(10,21)-(10,23)
*)

(* type error slice
*)
