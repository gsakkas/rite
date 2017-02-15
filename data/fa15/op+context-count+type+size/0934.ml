
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::l' ->
      let res = mulByDigit i l' in
      if (List.length res) = 0
      then (if (h * i) > 9 then [(h * i) / 10; (h * i) mod 10] else [h * i])
      else
        if (List.length res) = l'
        then
          (if (h * i) > 9
           then ((h * i) / 10) :: ((h * i) mod 10) :: res
           else (h * i) :: res)
        else
          (match res with
           | h'::res' ->
               if ((h * i) + h') > 9
               then (((h * i) + h') / 10) :: (((h * i) + h') mod 10) :: res'
               else ((h * i) + h') :: res);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::l' ->
      let res = mulByDigit i l' in
      if (List.length res) = 0
      then (if (h * i) > 9 then [(h * i) / 10; (h * i) mod 10] else [h * i])
      else
        if (List.length res) = (List.length l')
        then
          (if (h * i) > 9
           then ((h * i) / 10) :: ((h * i) mod 10) :: res
           else (h * i) :: res)
        else
          (match res with
           | h'::res' ->
               if ((h * i) + h') > 9
               then (((h * i) + h') / 10) :: (((h * i) + h') mod 10) :: res'
               else ((h * i) + h') :: res);;

*)

(* changed spans
(10,31)-(10,33)
*)

(* type error slice
(3,2)-(20,42)
(3,2)-(20,42)
(10,11)-(10,28)
(10,11)-(10,33)
(10,11)-(10,33)
(10,12)-(10,23)
(10,31)-(10,33)
*)
