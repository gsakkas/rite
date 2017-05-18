
let rec helper acc v =
  if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10);;

let _ = helper (9 * 9999);;
