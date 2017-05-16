
let rec helper acc v =
  if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10);;

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let helper acc v =
        if v = 0 then acc else (helper (v mod 10)) :: (acc (v / 10)) in
      helper [] h;;
