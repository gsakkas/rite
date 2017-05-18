
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t ->
      let rec helper acc v =
        if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10) in
      (helper ((mulByDigit i (List.rev t)) * 10)) + (h * i);;
