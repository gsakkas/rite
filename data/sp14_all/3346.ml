
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [helper [] (h * i)]
       with
       | [] -> []
       | h::t -> h);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(8,7)-(12,20)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ (helper []
                                                        (h * i) @ [])
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(12,22)
(2,20)-(12,20)
(2,22)-(12,20)
(3,3)-(12,20)
(6,7)-(12,20)
(8,7)-(12,20)
(8,14)-(8,71)
(8,14)-(9,35)
(8,15)-(8,25)
(8,72)-(8,73)
(12,18)-(12,19)
*)
